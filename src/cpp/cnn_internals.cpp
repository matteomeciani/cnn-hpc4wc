#include "include/cnn_internals.h"
#include "include/utils.h" // for colors and iostream


void conv2d_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                    int stride, int padding) {
    int out_channels = weight.batches;
    int in_channels  = weight.channels;
    int kernel_h     = weight.height;
    int kernel_w     = weight.width;

    std::fill(output.data.begin(), output.data.end(), 0.0f);

    for (int b = 0; b < input.batches; ++b) {
        for (int oc = 0; oc < out_channels; ++oc) {
            for (int oh = 0; oh < output.height; ++oh) {
                for (int ow = 0; ow < output.width; ++ow) {
                    float pixel_value = bias.data[oc];
                    for (int ic = 0; ic < in_channels; ++ic) {
                        for (int kh = 0; kh < kernel_h; ++kh) {
                            for (int kw = 0; kw < kernel_w; ++kw) {
                                int ih = oh * stride - padding + kh;
                                int iw = ow * stride - padding + kw;
                                if (ih >= 0 && ih < input.height && iw >= 0 && iw < input.width) {
                                    int in_idx = b * (input.channels * input.height * input.width) +
                                                 ic * (input.height * input.width) +
                                                 ih * input.width + iw;
                                    int w_idx  = oc * (weight.channels * weight.height * weight.width) +
                                                 ic * (weight.height * weight.width) +
                                                 kh * weight.width + kw;
                                    pixel_value += input.data[in_idx] * weight.data[w_idx];
                                }
                            }
                        }
                    }
                    int out_idx = b * (output.channels * output.height * output.width) +
                                  oc * (output.height * output.width) +
                                  oh * output.width + ow;
                    output.data[out_idx] = pixel_value;
                }
            }
        }
    }
}

void conv2d_forward_blocked(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                             int stride, int padding) {
    constexpr int OC_TILE = 4;
    constexpr int OW_TILE = 4;

    int out_channels = weight.batches;
    int in_channels  = weight.channels;
    int kernel_h     = weight.height;
    int kernel_w     = weight.width;

    std::fill(output.data.begin(), output.data.end(), 0.0f);

    for (int b = 0; b < input.batches; ++b) {
        for (int oh = 0; oh < output.height; ++oh) {
            for (int oc0 = 0; oc0 < out_channels; oc0 += OC_TILE) {
                int oc_lim = std::min(OC_TILE, out_channels - oc0);

                for (int ow0 = 0; ow0 < output.width; ow0 += OW_TILE) {
                    int ow_lim = std::min(OW_TILE, output.width - ow0);

                    // accumulator tile, lives in registers/L1
                    float acc[OC_TILE][OW_TILE];
                    for (int t_oc = 0; t_oc < oc_lim; ++t_oc)
                        for (int t_ow = 0; t_ow < ow_lim; ++t_ow)
                            acc[t_oc][t_ow] = bias.data[oc0 + t_oc];

                    for (int ic = 0; ic < in_channels; ++ic) {
                        for (int kh = 0; kh < kernel_h; ++kh) {
                            int ih = oh * stride - padding + kh;
                            if (ih < 0 || ih >= input.height) continue;

                            for (int kw = 0; kw < kernel_w; ++kw) {
                                for (int t_ow = 0; t_ow < ow_lim; ++t_ow) {
                                    int ow = ow0 + t_ow;
                                    int iw = ow * stride - padding + kw;
                                    if (iw < 0 || iw >= input.width) continue;

                                    int in_idx = b * (input.channels * input.height * input.width) +
                                                 ic * (input.height * input.width) +
                                                 ih * input.width + iw;
                                    float in_val = input.data[in_idx]; // reused across t_oc

                                    for (int t_oc = 0; t_oc < oc_lim; ++t_oc) {
                                        int oc = oc0 + t_oc;
                                        int w_idx = oc * (weight.channels * weight.height * weight.width) +
                                                    ic * (weight.height * weight.width) +
                                                    kh * weight.width + kw;
                                        acc[t_oc][t_ow] += in_val * weight.data[w_idx];
                                    }
                                }
                            }
                        }
                    }

                    // write tile back
                    for (int t_oc = 0; t_oc < oc_lim; ++t_oc) {
                        int oc = oc0 + t_oc;
                        for (int t_ow = 0; t_ow < ow_lim; ++t_ow) {
                            int ow = ow0 + t_ow;
                            int out_idx = b * (output.channels * output.height * output.width) +
                                          oc * (output.height * output.width) +
                                          oh * output.width + ow;
                            output.data[out_idx] = acc[t_oc][t_ow];
                        }
                    }
                }
            }
        }
    }
}



// Function-local flags (see declaration in cnn.h)
__attribute__((optimize("associative-math", "no-signed-zeros", "no-trapping-math")))
void conv2d_forward_noboundcheck(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                    int stride, int padding) {
    int out_channels = weight.batches;
    int in_channels  = weight.channels;
    int kernel_h     = weight.height;
    int kernel_w     = weight.width;

    // --- Safety checks -----------------------------------------------------
    // This function drops the in-bounds branch from the innermost loop to
    // allow vectorization. That's only safe if padding == 0 and output was
    // sized with the standard no-padding formula. If either assumption
    // breaks, we warn and bail out *without* crashing the whole benchmark
    // binary, since benchmark.cpp has no try/catch around implementation
    // calls and calling exit()/throw here would take down every other
    // registered implementation too.

    bool ok = true;

    if (padding != 0) {
        std::cerr << Color::RED << "Error: conv2d_forward_autovec only supports padding == 0 (got "
                   << padding << "). Skipping this call." << Color::RESET << "\n";
        ok = false;
    }

    if (weight.channels != input.channels) {
        std::cerr << Color::RED << "Error: conv2d_forward_autovec channel mismatch — weight.channels="
                   << weight.channels << " but input.channels=" << input.channels
                   << ". Skipping this call." << Color::RESET << "\n";
        ok = false;
    }

    int expected_out_h = (input.height - kernel_h) / stride + 1;
    int expected_out_w = (input.width  - kernel_w) / stride + 1;

    if (output.height != expected_out_h || output.width != expected_out_w) {
        std::cerr << Color::RED << "Error: conv2d_forward_autovec output dims (" << output.height << "x"
                   << output.width << ") don't match formula-derived dims (" << expected_out_h << "x"
                   << expected_out_w << "). Skipping this call." << Color::RESET << "\n";
        ok = false;
    }

    if (output.batches != input.batches || output.channels != out_channels) {
        std::cerr << Color::RED << "Error: conv2d_forward_autovec output batch/channel dims don't match "
                   << "input/weight. Skipping this call." << Color::RESET << "\n";
        ok = false;
    }

    if (!ok) {
        std::fill(output.data.begin(), output.data.end(), 0.0f);  // leave output well-defined
        return;
    }
    // -------------------------------------------------------------------------

    std::fill(output.data.begin(), output.data.end(), 0.0f);

    for (int b = 0; b < input.batches; ++b) {
        for (int oc = 0; oc < out_channels; ++oc) {
            for (int oh = 0; oh < output.height; ++oh) {
                for (int ow = 0; ow < output.width; ++ow) {
                    float pixel_value = bias.data[oc];
                    for (int ic = 0; ic < in_channels; ++ic) {
                        for (int kh = 0; kh < kernel_h; ++kh) {
                            for (int kw = 0; kw < kernel_w; ++kw) {
                                int ih = oh * stride + kh;
                                int iw = ow * stride + kw;
                                int in_idx = b * (input.channels * input.height * input.width) +
                                             ic * (input.height * input.width) +
                                             ih * input.width + iw;
                                int w_idx  = oc * (weight.channels * weight.height * weight.width) +
                                             ic * (weight.height * weight.width) +
                                             kh * weight.width + kw;
                                pixel_value += input.data[in_idx] * weight.data[w_idx];
                            }
                        }
                    }
                    int out_idx = b * (output.channels * output.height * output.width) +
                                  oc * (output.height * output.width) +
                                  oh * output.width + ow;
                    output.data[out_idx] = pixel_value;
                }
            }
        }
    }
}


void relu_forward(Tensor& tensor) {
    int n = tensor.batches * tensor.channels * tensor.height * tensor.width;
    for (int i = 0; i < n; ++i)
        if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
}

void linear_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output) {
    int in_features  = weight.width;
    int out_features = weight.height;

    std::fill(output.data.begin(), output.data.end(), 0.0f);

    for (int b = 0; b < input.batches; ++b) {
        for (int out_f = 0; out_f < out_features; ++out_f) {
            float val = bias.data[out_f];
            for (int in_f = 0; in_f < in_features; ++in_f)
                val += input.data[b * in_features + in_f] * weight.data[out_f * in_features + in_f];
            output.data[b * out_features + out_f] = val;
        }
    }
}

void maxpool2d_forward(const Tensor& input, Tensor& output, int pool_size, int stride) {
    std::fill(output.data.begin(), output.data.end(), -1e9f);

    for (int b = 0; b < input.batches; ++b) {
        for (int c = 0; c < input.channels; ++c) {
            for (int oh = 0; oh < output.height; ++oh) {
                for (int ow = 0; ow < output.width; ++ow) {
                    float max_val = -1e9f;
                    for (int ph = 0; ph < pool_size; ++ph) {
                        for (int pw = 0; pw < pool_size; ++pw) {
                            int ih = oh * stride + ph;
                            int iw = ow * stride + pw;
                            if (ih < input.height && iw < input.width) {
                                int in_idx = b * (input.channels * input.height * input.width) +
                                             c * (input.height * input.width) +
                                             ih * input.width + iw;
                                max_val = std::max(max_val, input.data[in_idx]);
                            }
                        }
                    }
                    int out_idx = b * (output.channels * output.height * output.width) +
                                  c * (output.height * output.width) +
                                  oh * output.width + ow;
                    output.data[out_idx] = max_val;
                }
            }
        }
    }
}

void adaptive_avgpool2d_forward(const Tensor& input, Tensor& output) {
    std::fill(output.data.begin(), output.data.end(), 0.0f);
    int spatial_size = input.height * input.width;

    for (int b = 0; b < input.batches; ++b) {
        for (int c = 0; c < input.channels; ++c) {
            float sum = 0.0f;
            for (int i = 0; i < spatial_size; ++i)
                sum += input.data[b * (input.channels * spatial_size) + c * spatial_size + i];
            output.data[b * input.channels + c] = sum / spatial_size;
        }
    }
}




void conv2d_forward_im2col(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                             int stride, int padding) {
    int out_channels = weight.batches;   // C_out
    int in_channels  = weight.channels;  // C_in
    int kernel_h     = weight.height;    // K_h
    int kernel_w     = weight.width;     // K_w

    int out_h = output.height;
    int out_w = output.width;

    int K = in_channels * kernel_h * kernel_w; // Matrix inner dimension
    int N = out_h * out_w;                     // Spatial positions per image
    int M = out_channels;                      // Output channels

    // Pre-allocating buffer for the im2col matrix
    std::vector<float> im2col_buf(K * N);

    for (int b = 0; b < input.batches; ++b) {
        // 1. Constructing the im2col matrix for batch 'b'
        for (int ic = 0; ic < in_channels; ++ic) {
            for (int kh = 0; kh < kernel_h; ++kh) {
                for (int kw = 0; kw < kernel_w; ++kw) {
                    int row = (ic * kernel_h + kh) * kernel_w + kw;
                    for (int oh = 0; oh < out_h; ++oh) {
                        int ih = oh * stride - padding + kh;
                        for (int ow = 0; ow < out_w; ++ow) {
                            int iw = ow * stride - padding + kw;
                            int col = oh * out_w + ow;

                            float val = 0.0f;
                            if (ih >= 0 && ih < input.height && iw >= 0 && iw < input.width) {
                                int in_idx = b * (input.channels * input.height * input.width) +
                                             ic * (input.height * input.width) +
                                             ih * input.width + iw;
                                val = input.data[in_idx];
                            }
                            im2col_buf[row * N + col] = val;
                        }
                    }
                }
            }
        }

        // 2. Performing GEMM: Y = W * X + Bias
        int batch_offset = b * (out_channels * N);

        for (int oc = 0; oc < M; ++oc) {
            int out_channel_offset = batch_offset + oc * N;
            float b_val = bias.data[oc];

            // Initializing output row with bias vector
            for (int col = 0; col < N; ++col) {
                output.data[out_channel_offset + col] = b_val;
            }

            // Multiplying row of W with im2col matrix X
            const float* w_row = &weight.data[oc * K];
            for (int k = 0; k < K; ++k) {
                float w_val = w_row[k];
                const float* col_row = &im2col_buf[k * N];
                float* out_row = &output.data[out_channel_offset];

                #pragma omp simd
                for (int col = 0; col < N; ++col) {
                    out_row[col] += w_val * col_row[col];
                }
            }
        }
    }
}



