#include "include/timing.h"
#include "include/cnn.h"
#include "include/utils.h"

#ifndef NUM_RUNS
#define NUM_RUNS 10
#endif
#ifndef NUM_WARMUP_RUNS
#define NUM_WARMUP_RUNS 2
#endif

int main(int argc, char** argv) {
    // In "verify" mode a single forward pass is run and the logits for every
    // image are dumped to disk for comparison against PyTorch (see verify.py).
    // "-v"/"--verbose"/"verbose" prints the per-class logits (see benchmark.py
    // for the equivalent Python flag).
    bool verify_mode = false;
    bool verbose      = false;
    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "verify")
            verify_mode = true;
        else if (arg == "-v" || arg == "--verbose" || arg == "verbose")
            verbose = true;
    }

    // Verify mode needs the full test set dumped for comparison against
    // PyTorch; timing runs only measure a single-image forward pass.
    int batch_size  = verify_mode ? 10000 : 1;
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

    CNNContext ctx = {
        input_batch,
        conv1_weight, conv1_bias, conv1_out, pool1_out,
        conv2_weight, conv2_bias, conv2_out, pool2_out,
        conv3_weight, conv3_bias, conv3_out, avgpool_out,
        fc_weight,    fc_bias,    final_logits
    };

    // 4. FORWARD PASS
    std::cout << Color::BOLD_CYAN << "The full machine learning forward pass is starting..." << Color::RESET << "\n";

    if (verify_mode) {
        cnn_baseline(ctx);
        const std::string out_path = "../python/weights_cpp/cpp_logits.bin";
        save_binary(out_path, final_logits.data);
        std::cout << Color::BOLD_GREEN << "Wrote logits for " << input_batch.batches
                  << " images to " << out_path << Color::RESET << "\n";
        return 0;
    }

    // Warmup
    for (int run = 0; run < NUM_WARMUP_RUNS; ++run)
        cnn_baseline(ctx);

    // Timed run
    for (int run = 0; run < NUM_RUNS; ++run) {
        pmu_cycles_start(&pmu);
        start_timer(&timer_ctx);

        cnn_baseline(ctx);

        stop_timer(&timer_ctx);
        uint64_t cycles = pmu_cycles_stop(&pmu);

        os_sec_arr[run] = get_elapsed_os_sec(&timer_ctx);
        cycles_arr[run] = (double)cycles;
    }

    pmu_cycles_close(&pmu);

    // 5. RESULTS
    if (verbose) {
        std::cout << Color::BOLD_YELLOW << "\nRaw Logits (Computational Verification):" << Color::RESET << "\n";
        for (int i = 0; i < num_classes; ++i)
            std::cout << "Class " << i << ": " << final_logits.data[i] << "\n";
    }

    int predicted_digit = get_prediction(final_logits);
    std::cout << Color::BOLD_GREEN << "\nThe network has successfully predicted the digit: "
              << predicted_digit << Color::RESET << "\n";

    double median_os_sec = compute_median(os_sec_arr, NUM_RUNS);
    std::cout << Color::BOLD_YELLOW << "\nMedian OS time for the forward pass over " << NUM_RUNS << " runs: "
              << median_os_sec << " seconds" << Color::RESET << "\n";

    double median_cycles = compute_median(cycles_arr, NUM_RUNS);
    std::cout << Color::BOLD_YELLOW << "Median CPU cycles for the forward pass over " << NUM_RUNS << " runs: "
              << median_cycles << " cycles" << Color::RESET << "\n";

    // Persisted for benchmark.py's C++ vs Python comparison table.
    std::ofstream timing_file("../python/weights_cpp/cpp_timing.json");
    if (timing_file.is_open()) {
        timing_file << "{\n"
                    << "  \"median_time_sec\": " << median_os_sec << ",\n"
                    << "  \"median_cycles\": " << median_cycles << "\n"
                    << "}\n";
    }

    return 0;
}
