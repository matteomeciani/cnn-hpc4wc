#include "include/cnn_internals.h"
#include "include/timing.h"

#define NUM_RUNS 10
#define NUM_WARMUP_RUNS 2

int main() {
    int batch_size  = 1;
    int num_classes = 10;

    // Timing context
    timer_context_t timer_ctx;
    double *os_sec_arr = (double *)malloc((size_t)NUM_RUNS * sizeof(double));

    pmu_ctx_t pmu;

    if (pmu_cycles_init(&pmu) != 0) {
        std::cerr << Color::RED << "PMU init failed — cycle counts will be invalid.\n" << Color::RESET;
    }
    double *cycles_arr = (double *)malloc((size_t)NUM_RUNS * sizeof(double));

    std::cout << Color::CYAN << "Memory allocation is starting..." << Color::RESET << "\n";

    // 1. INPUT
    Tensor input_batch;
    try {
        load_mnist_images("../../data/MNIST/raw/t10k-images-idx3-ubyte", input_batch, batch_size);
        std::cout << Color::GREEN << "MNIST dataset successfully loaded." << Color::RESET << "\n";
    } catch (const std::exception& e) {
        std::cerr << Color::RED << e.what() << Color::RESET << "\n";
        return 1;
    }

#ifdef PRINT_ASCII
    print_ascii_image(input_batch, 0);
#endif

    // 2. WEIGHTS
    std::cout << Color::BOLD_CYAN << "\nLoading real weights..." << Color::RESET << "\n";
    const std::string w_path = "../python/weights_cpp/";

    Tensor conv1_weight = {std::vector<float>(32 * 1 * 3 * 3), 32,  1,  3,   3};
    Tensor conv1_bias   = {std::vector<float>(32), 32,  1,  1,   1};
    load_binary_weights(w_path + "model_0_weight.bin", conv1_weight.data);
    load_binary_weights(w_path + "model_0_bias.bin", conv1_bias.data);

    Tensor conv2_weight = {std::vector<float>(64 * 32 * 3 * 3), 64, 32,  3,   3};
    Tensor conv2_bias   = {std::vector<float>(64), 64,  1,  1,   1};
    load_binary_weights(w_path + "model_3_weight.bin", conv2_weight.data);
    load_binary_weights(w_path + "model_3_bias.bin", conv2_bias.data);

    Tensor conv3_weight = {std::vector<float>(128 * 64 * 3 * 3), 128, 64,  3,   3};
    Tensor conv3_bias   = {std::vector<float>(128), 128,  1,  1,   1};
    load_binary_weights(w_path + "model_6_weight.bin", conv3_weight.data);
    load_binary_weights(w_path + "model_6_bias.bin", conv3_bias.data);

    Tensor fc_weight    = {std::vector<float>(num_classes * 128),        1,  1, num_classes, 128};
    Tensor fc_bias      = {std::vector<float>(num_classes), num_classes, 1,  1,   1};
    load_binary_weights(w_path + "model_10_weight.bin", fc_weight.data);
    load_binary_weights(w_path + "model_10_bias.bin", fc_bias.data);

    // 3. INTERMEDIATE ACTIVATIONS
    Tensor conv1_out   = {std::vector<float>(batch_size * 32  * 26 * 26), batch_size,  32, 26, 26};
    Tensor pool1_out   = {std::vector<float>(batch_size * 32  * 13 * 13), batch_size,  32, 13, 13};
    Tensor conv2_out   = {std::vector<float>(batch_size * 64  * 11 * 11), batch_size,  64, 11, 11};
    Tensor pool2_out   = {std::vector<float>(batch_size * 64  *  5 *  5), batch_size,  64,  5,  5};
    Tensor conv3_out   = {std::vector<float>(batch_size * 128 *  3 *  3), batch_size, 128,  3,  3};
    Tensor avgpool_out = {std::vector<float>(batch_size * 128),           batch_size, 128,  1,  1};
    Tensor final_logits= {std::vector<float>(batch_size * num_classes),   batch_size,   1,  1, num_classes};

    // 4. FORWARD PASS
    std::cout << Color::BOLD_CYAN << "The full machine learning forward pass is starting..." << Color::RESET << "\n";

    // Warmup
    for (int run = 0; run < NUM_WARMUP_RUNS; ++run) {
        conv2d_forward(input_batch, conv1_weight, conv1_bias, conv1_out, 1, 0);
        relu_forward(conv1_out);
        maxpool2d_forward(conv1_out, pool1_out, 2, 2);

        conv2d_forward(pool1_out, conv2_weight, conv2_bias, conv2_out, 1, 0);
        relu_forward(conv2_out);
        maxpool2d_forward(conv2_out, pool2_out, 2, 2);

        conv2d_forward(pool2_out, conv3_weight, conv3_bias, conv3_out, 1, 0);
        relu_forward(conv3_out);
        adaptive_avgpool2d_forward(conv3_out, avgpool_out);

        linear_forward(avgpool_out, fc_weight, fc_bias, final_logits);
    }

    // Timed run
    for (int run = 0; run < NUM_RUNS; ++run) {
        pmu_cycles_start(&pmu);
        start_timer(&timer_ctx);

        conv2d_forward(input_batch, conv1_weight, conv1_bias, conv1_out, 1, 0);
        relu_forward(conv1_out);
        maxpool2d_forward(conv1_out, pool1_out, 2, 2);

        conv2d_forward(pool1_out, conv2_weight, conv2_bias, conv2_out, 1, 0);
        relu_forward(conv2_out);
        maxpool2d_forward(conv2_out, pool2_out, 2, 2);

        conv2d_forward(pool2_out, conv3_weight, conv3_bias, conv3_out, 1, 0);
        relu_forward(conv3_out);
        adaptive_avgpool2d_forward(conv3_out, avgpool_out);

        linear_forward(avgpool_out, fc_weight, fc_bias, final_logits);

        stop_timer(&timer_ctx);
        uint64_t cycles = pmu_cycles_stop(&pmu);

        os_sec_arr[run] = get_elapsed_os_sec(&timer_ctx);
        cycles_arr[run] = (double)cycles;
    }

    pmu_cycles_close(&pmu);

    // 5. RESULTS
    std::cout << Color::BOLD_YELLOW << "\nRaw Logits (Computational Verification):" << Color::RESET << "\n";
    for (int i = 0; i < num_classes; ++i)
        std::cout << "Class " << i << ": " << final_logits.data[i] << "\n";

    int predicted_digit = get_prediction(final_logits);
    std::cout << Color::BOLD_GREEN << "\nThe network has successfully predicted the digit: "
              << predicted_digit << Color::RESET << "\n";

    double median_os_sec = compute_median(os_sec_arr, NUM_RUNS);
    std::cout << Color::BOLD_YELLOW << "\nMedian OS time for the forward pass over " << NUM_RUNS << " runs: "
              << median_os_sec << " seconds" << Color::RESET << "\n";

    double median_cycles = compute_median(cycles_arr, NUM_RUNS);
    std::cout << Color::BOLD_YELLOW << "Median CPU cycles for the forward pass over " << NUM_RUNS << " runs: "
              << median_cycles << " cycles" << Color::RESET << "\n";

    return 0;
}
