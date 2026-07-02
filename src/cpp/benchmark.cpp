#include "include/timing.h"
#include "include/cnn.h"
#include "include/utils.h"

#include <cmath>
#include <cstring>

#ifndef NUM_RUNS
#define NUM_RUNS 10
#endif
#ifndef NUM_WARMUP_RUNS
#define NUM_WARMUP_RUNS 2
#endif

// Prevents the compiler from dead-code-eliminating the forward pass.
static volatile double benchmark_global_sink = 0.0;

typedef struct {
    const char *name;
    cnn_func function;
} benchmark_impl_t;

typedef struct {
    double cycles_median;
    double seconds_median;
    bool has_data;
} bench_result_t;

// ----------------------------------------------------------------------------
// Runs a warm-cache phase for a single implementation: warmup runs followed
// by NUM_RUNS measured runs, reporting median cycles/seconds.
// ----------------------------------------------------------------------------
static bench_result_t benchmark_cnn(cnn_func f, CNNContext &ctx,
                                    pmu_ctx_t &pmu, int num_runs, int num_warmup) {
    bench_result_t result = {NAN, NAN, false};

    std::cout << Color::GREEN << "--- Performance Benchmarking (" << num_runs << " Runs) ---"
               << Color::RESET << "\n";

    std::vector<double> cycles_arr((size_t)num_runs);
    std::vector<double> sec_arr((size_t)num_runs);

    std::cout << "Running " << num_warmup << " warmup run" << (num_warmup == 1 ? "" : "s") << "...\n";
    for (int w = 0; w < num_warmup; ++w) {
        f(ctx);
        benchmark_global_sink += checksum_tensor(ctx.final_logits);
    }

    std::cout << "Warmup complete. Starting " << num_runs << " benchmark run"
              << (num_runs == 1 ? "" : "s") << "...\n";

    for (int i = 0; i < num_runs; ++i) {

        timer_context_t timer_ctx;
        pmu_cycles_start(&pmu);
        start_timer(&timer_ctx);

        f(ctx);

        stop_timer(&timer_ctx);
        uint64_t cycles = pmu_cycles_stop(&pmu);

        sec_arr[i] = get_elapsed_os_sec(&timer_ctx);
        cycles_arr[i] = (double)cycles;

        benchmark_global_sink += checksum_tensor(ctx.final_logits);
    }

    result.has_data = true;
    result.cycles_median = compute_median(cycles_arr.data(), num_runs);
    result.seconds_median = compute_median(sec_arr.data(), num_runs);

    std::cout << Color::GREEN << "=== Results ===" << Color::RESET << "\n";
    std::cout << "  Median cycles : " << result.cycles_median << "\n";
    std::cout << "  Median time   : " << result.seconds_median
              << " s (" << result.seconds_median * 1000.0 << " ms)\n\n";

    return result;
}

int main(int argc, char** argv) {
    bool verify_mode = false;
    bool verbose = false;
    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "verify")
            verify_mode = true;
        else if (arg == "-v" || arg == "--verbose" || arg == "verbose")
            verbose = true;
    }

    int batch_size  = verify_mode ? 10000 : 1;
    int num_classes = 10;

    int num_runs = NUM_RUNS;
    int num_warmup = NUM_WARMUP_RUNS;

    pmu_ctx_t pmu;
    if (pmu_cycles_init(&pmu) != 0) {
        std::cerr << Color::RED << "PMU init failed — cycle counts will be invalid.\n" << Color::RESET;
    }

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


    if (verify_mode) {
        cnn_baseline(ctx);
        const std::string out_path = "../python/weights_cpp/cpp_logits.bin";
        save_binary(out_path, final_logits.data);
        std::cout << Color::BOLD_GREEN << "Wrote logits for " << input_batch.batches
                  << " images to " << out_path << Color::RESET << "\n";
        pmu_cycles_close(&pmu);
        return 0;
    }

    // ------------------------------------------------------------------
    // Registered implementations (see CNN_IMPLEMENTATIONS in cnn.h)
    // ------------------------------------------------------------------
        #define CNN_BENCH_ENTRY(function, name) {name, function},
    const benchmark_impl_t implementations[] = {
        CNN_IMPLEMENTATIONS(CNN_BENCH_ENTRY)
    };
    #undef CNN_BENCH_ENTRY

    int num_impls = sizeof(implementations) / sizeof(implementations[0]);
    std::vector<bench_result_t> results((size_t)num_impls);

    const char *bench_filter = std::getenv("CNN_BENCH_FILTER");
    int num_selected = 0;
    for (int i = 0; i < num_impls; ++i)
        if (implementation_matches_filter(implementations[i].name, bench_filter)) num_selected++;

    if (num_selected == 0) {
        std::cerr << "Error: CNN_BENCH_FILTER matched no implementations: "
                  << (bench_filter ? bench_filter : "") << "\n";
        pmu_cycles_close(&pmu);
        return 1;
    }
    if (bench_filter && *bench_filter) {
        std::cout << Color::BOLD_CYAN << "Benchmark filter: " << bench_filter
                  << " (" << num_selected << " of " << num_impls << " implementations)"
                  << Color::RESET << "\n\n";
    }

    std::cout << Color::BOLD_CYAN << "Runs: " << num_runs << " measured, "
              << num_warmup << " warmup\n\n" << Color::RESET;

    // ------------------------------------------------------------------
    // Execution loop: warm cache only for every implementation
    // ------------------------------------------------------------------
    for (int i = 0; i < num_impls; ++i) {
        if (!implementation_matches_filter(implementations[i].name, bench_filter)) continue;

        std::cout << Color::CYAN << "==================================================\n"
                  << " -> Benchmarking " << implementations[i].name << " (WARM CACHE)\n"
                  << "==================================================" << Color::RESET << "\n";
        results[i] = benchmark_cnn(implementations[i].function, ctx, pmu, num_runs, num_warmup);
        std::cout << "\n\n";
    }

    pmu_cycles_close(&pmu);

    int predicted_digit = get_prediction(final_logits);
    std::cout << Color::BOLD_GREEN << "The network has successfully predicted the digit: "
              << predicted_digit << Color::RESET << "\n\n";

    if (verbose) {
        std::cout << Color::BOLD_YELLOW << "Raw Logits (Computational Verification):" << Color::RESET << "\n";
        for (int i = 0; i < num_classes; ++i)
            std::cout << "Class " << i << ": " << final_logits.data[i] << "\n";
        std::cout << "\n";
    }

    // ------------------------------------------------------------------
    // Final Summary Table
    // ------------------------------------------------------------------
    std::cout << Color::BOLD_YELLOW << "=== Final Performance Summary ===" << Color::RESET << "\n\n";
    printf("%-35s | %-12s | %-20s | %-14s\n",
           "Implementation", "vs Base", "Cycles", "Seconds");
    printf("---------------------------------------------------------------------------------------\n");

    int baseline_idx = -1;
    int best_idx = -1;
    double baseline_cycles = 0.0;
    double best_cycles = 0.0;

    for (int i = 0; i < num_impls; ++i) {
        if (!implementation_matches_filter(implementations[i].name, bench_filter)) continue;
        if (!results[i].has_data) continue;
        if (std::strcmp(implementations[i].name, "Baseline Nested-Loop") == 0) {
            baseline_idx = i;
            baseline_cycles = results[i].cycles_median;
        }
        if (best_idx < 0 || results[i].cycles_median < best_cycles) {
            best_idx = i;
            best_cycles = results[i].cycles_median;
        }
    }

    for (int i = 0; i < num_impls; ++i) {
        if (!implementation_matches_filter(implementations[i].name, bench_filter)) continue;

        char speedup_text[32] = "";
        if (baseline_idx >= 0 && results[i].has_data && results[i].cycles_median > 0.0) {
            snprintf(speedup_text, sizeof(speedup_text), "%.2fx",
                     baseline_cycles / results[i].cycles_median);
        }

        char cyc[24], sec[24];
        if (results[i].has_data) {
            snprintf(cyc, sizeof(cyc), "%.2f", results[i].cycles_median);
            snprintf(sec, sizeof(sec), "%.6f", results[i].seconds_median);
        } else {
            snprintf(cyc, sizeof(cyc), "-");
            snprintf(sec, sizeof(sec), "-");
        }

        bool is_best = (i == best_idx);
        if (is_best) std::cout << Color::GREEN;
        printf("%-35s | %-12s | %-20s | %-14s",
               implementations[i].name, speedup_text, cyc, sec);
        if (is_best) std::cout << Color::RESET;
        std::cout << "\n";
    }

    std::cout << "\nBenchmark sink: " << benchmark_global_sink << "\n\n";

    // Persisted for benchmark.py's C++ vs Python comparison table (uses the
    // baseline implementation's numbers, matching the original single-impl file).
    if (baseline_idx >= 0) {
        std::ofstream timing_file("../python/weights_cpp/cpp_timing.json");
        if (timing_file.is_open()) {
            timing_file << "{\n"
                        << "  \"median_time_sec\": " << results[baseline_idx].seconds_median << ",\n"
                        << "  \"median_cycles\": " << results[baseline_idx].cycles_median << "\n"
                        << "}\n";
        }
    }

    return 0;
}
