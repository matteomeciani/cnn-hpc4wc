#include "include/cnn_internals.h"

// -----------------------------------------------
// Baseline nested loops implementation internals
// -----------------------------------------------
void conv2d_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                    int stride, int padding) {
    int out_channels = weight.batches;
    int in_channels  = weight.channels;
    int kernel_h     = weight.height;
    int kernel_w     = weight.width;


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

void conv2d_forward_restructured(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                    int stride, int padding) {
    int out_channels = weight.batches;
    int in_channels  = weight.channels;
    int kernel_h     = weight.height;
    int kernel_w     = weight.width;
    int input_h      = input.height;
    int input_w      = input.width;
    int output_h     = output.height;
    int output_w     = output.width;
    int input_batches = input.batches;

    for (int b = 0; b < input_batches; ++b) {
        for (int oc = 0; oc < out_channels; ++oc) {
            
            for (int oh = 0; oh < output_h; ++oh) {
                int c_h = oh * stride - padding;
                
                int kh_lo = std::max(0, -c_h);
                int kh_hi = std::min(kernel_h, input_h - c_h);
                
                for (int ow = 0; ow < output_w; ++ow) {
                    float pixel_value = bias.data[oc];

                    int c_w = ow * stride - padding;

                    int kw_lo = std::max(0, -c_w);
                    int kw_hi = std::min(kernel_w, input_w - c_w);
                    
                    for (int ic = 0; ic < in_channels; ++ic) {
                        for (int kh = kh_lo; kh < kh_hi; ++kh) {
                            for (int kw = kw_lo; kw < kw_hi; ++kw) {
                                int ih = c_h + kh;
                                int iw = c_w + kw;
                                int in_idx = b * (in_channels * input_h * input_w) +
                                                ic * (input_h * input_w) +
                                                ih * input_w + iw;
                                int w_idx  = oc * (in_channels * kernel_h * kernel_w) +
                                                ic * (kernel_h * kernel_w) +
                                                kh * kernel_w + kw;
                                pixel_value += input.data[in_idx] * weight.data[w_idx];
                            }
                        }
                    }
                    int out_idx = b * (output.channels * output_h * output_w) +
                                  oc * (output_h * output_w) +
                                  oh * output_w + ow;
                    output.data[out_idx] = pixel_value;
                }
            }
        }
    }
}

void conv2d_forward_hoist_restrict(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                    int stride, int padding) {
    const float* __restrict input_ptr  = input.data.data();
    const float* __restrict weight_ptr = weight.data.data();
    const float* __restrict bias_ptr   = bias.data.data();
    float* __restrict       out_ptr    = output.data.data();
    
    int out_channels = weight.batches;
    int in_channels  = weight.channels;
    int kernel_h     = weight.height;
    int kernel_w     = weight.width;
    int input_h      = input.height;
    int input_w      = input.width;
    int output_h     = output.height;
    int output_w     = output.width;
    int input_batches = input.batches;

    int in_size = input_h * input_w;
    int in_ch_size = in_channels * in_size;
    int out_size = output_h * output_w;
    int out_ch_size = out_channels * out_size;
    int weight_size = kernel_h * kernel_w;
    int weight_ch_size = in_channels * weight_size;

    for (int b = 0; b < input_batches; ++b) {
        int in_b_ch_size = b * in_ch_size;
        int out_b_ch_size = b * out_ch_size;
        for (int oc = 0; oc < out_channels; ++oc) {
            int out_oc_ch_size = oc * weight_ch_size;
            int out_oc_size = oc * out_size;
            
            for (int oh = 0; oh < output_h; ++oh) {
                int c_h = oh * stride - padding;
                
                int kh_lo = std::max(0, -c_h);
                int kh_hi = std::min(kernel_h, input_h - c_h);
                
                for (int ow = 0; ow < output_w; ++ow) {
                    float pixel_value = bias_ptr[oc];

                    int c_w = ow * stride - padding;

                    int kw_lo = std::max(0, -c_w);
                    int kw_hi = std::min(kernel_w, input_w - c_w);
                    
                    for (int ic = 0; ic < in_channels; ++ic) {
                        int ic_size = ic * in_size;
                        int ic_weight_size = ic * weight_size;
                        
                        for (int kh = kh_lo; kh < kh_hi; ++kh) {
                            for (int kw = kw_lo; kw < kw_hi; ++kw) {
                                int ih = c_h + kh;
                                int iw = c_w + kw;
                                int in_idx = in_b_ch_size + ic_size + ih * input_w + iw;
                                int w_idx  = out_oc_ch_size + ic_weight_size + kh * kernel_w + kw;
                                
                                pixel_value += input_ptr[in_idx] * weight_ptr[w_idx];
                            }
                        }
                    }
                    int out_idx = out_b_ch_size + out_oc_size + oh * output_w + ow;
                    out_ptr[out_idx] = pixel_value;
                }
            }
        }
    }
}


void conv2d_forward_hoist(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                    int stride, int padding) {
    const float* __restrict input_ptr  = input.data.data();
    const float* __restrict weight_ptr = weight.data.data();
    const float* __restrict bias_ptr   = bias.data.data();
    float* __restrict       out_ptr    = output.data.data();
    
    std::vector<float> acc(output_w); 
    float* __restrict acc_ptr = acc.data();

    int out_channels = weight.batches;
    int in_channels  = weight.channels;
    int kernel_h     = weight.height;
    int kernel_w     = weight.width;
    int input_h      = input.height;
    int input_w      = input.width;
    int output_h     = output.height;
    int output_w     = output.width;
    int input_batches = input.batches;

    int in_size = input_h * input_w;
    int in_ch_size = in_channels * in_size;
    int out_size = output_h * output_w;
    int out_ch_size = out_channels * out_size;
    int weight_size = kernel_h * kernel_w;
    int weight_ch_size = in_channels * weight_size;

    for (int b = 0; b < input_batches; ++b) {
        int in_b_ch_size = b * in_ch_size;
        int out_b_ch_size = b * out_ch_size;
        for (int oc = 0; oc < out_channels; ++oc) {
            int out_oc_ch_size = oc * weight_ch_size;
            int out_oc_size = oc * out_size;
            
            for (int oh = 0; oh < output_h; ++oh) {
                int c_h = oh * stride - padding;
                
                int kh_lo = std::max(0, -c_h);
                int kh_hi = std::min(kernel_h, input_h - c_h);
                
                

                for (int ow = 0; ow < output_w; ++ow) {
                    float pixel_value = bias_ptr[oc];

                    int c_w = ow * stride - padding;

                    int kw_lo = std::max(0, -c_w);
                    int kw_hi = std::min(kernel_w, input_w - c_w);
                    
                    for (int ic = 0; ic < in_channels; ++ic) {
                        int ic_size = ic * in_size;
                        int ic_weight_size = ic * weight_size;
                        
                        for (int kh = kh_lo; kh < kh_hi; ++kh) {
                            for (int kw = kw_lo; kw < kw_hi; ++kw) {
                                int ih = c_h + kh;
                                int iw = c_w + kw;
                                int in_idx = in_b_ch_size + ic_size + ih * input_w + iw;
                                int w_idx  = out_oc_ch_size + ic_weight_size + kh * kernel_w + kw;
                                
                                pixel_value += input_ptr[in_idx] * weight_ptr[w_idx];
                            }
                        }
                    }
                    int out_idx = out_b_ch_size + out_oc_size + oh * output_w + ow;
                    out_ptr[out_idx] = pixel_value;
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


/* Optimizations to try:
*   - Loop reordering / change data structure for better cache locality
*   - Restrict pointers to help compiler optimizations
*   - Tiling / blocking to improve cache reuse
*   - Loop unrolling + multiple accumulators to reduce loop overhead
*   - SIMD vectorization (AVX2, AVX512, etc.)
*   - Parallelism (OpenMP, MPI, etc.)
*/

