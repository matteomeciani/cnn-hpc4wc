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

void conv2d_forward_reorder(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
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

    std::vector<float> acc(output_w); 
    float* __restrict acc_ptr = acc.data();

    for (int b = 0; b < input_batches; ++b) {
        int in_b_ch_size = b * in_ch_size;
        int out_b_ch_size = b * out_ch_size;

        for (int oc = 0; oc < out_channels; ++oc) {
            int out_oc_ch_size = oc * weight_ch_size;
            int out_oc_size = oc * out_size;
            const float b_val = bias_ptr[oc];
            
            for (int oh = 0; oh < output_h; ++oh) {
                for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;

                int c_h = oh * stride - padding;
                int kh_lo = std::max(0, -c_h);
                int kh_hi = std::min(kernel_h, input_h - c_h);

                for (int ic = 0; ic < in_channels; ++ic) {
                    int ic_size = ic * in_size;
                    int ic_weight_size = ic * weight_size;
                    
                    for (int kh = kh_lo; kh < kh_hi; ++kh) {
                        int ih = c_h + kh;
                        int in_row_offset = in_b_ch_size + ic_size + ih * input_w;
                        int kh_kernel_w = kh * kernel_w;

                        for (int kw = 0; kw < kernel_w; ++kw) {
                            int num   = padding - kw;
                            int ow_lo = num <= 0 ? 0 : (num + stride - 1) / stride;
                            int ow_hi = std::min(output_w, (input_w + padding - kw - 1) / stride + 1);

                            int w_idx  = out_oc_ch_size + ic_weight_size + kh_kernel_w + kw;
                            float w_val = weight_ptr[w_idx];

                            for (int ow = ow_lo; ow < ow_hi; ++ow) {
                                int iw = ow * stride - padding + kw;
                                
                                acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
                            }
                        }
                    }
                }   
                int out_row = out_b_ch_size + out_oc_size + oh * output_w;
                for (int ow = 0; ow < output_w; ++ow) {
                    out_ptr[out_row + ow] = acc_ptr[ow];
                }
            }
        }
    }
}

void conv2d_forward_specialized(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output) {
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

    constexpr int MAX_OW = 64;
    alignas(16) float acc[MAX_OW]; 

    for (int b = 0; b < input_batches; ++b) {
        int in_b_ch_size = b * in_ch_size;
        int out_b_ch_size = b * out_ch_size;

        for (int oc = 0; oc < out_channels; ++oc) {
            int out_oc_ch_size = oc * weight_ch_size;
            int out_oc_size = oc * out_size;
            const float b_val = bias_ptr[oc];
            
            for (int oh = 0; oh < output_h; ++oh) {
                for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;

                for (int ic = 0; ic < in_channels; ++ic) {
                    int ic_size = ic * in_size;
                    int ic_weight_size = ic * weight_size;
                    
                    for (int kh = 0; kh < kernel_h; ++kh) {
                        int ih = oh + kh;
                        int in_row_offset = in_b_ch_size + ic_size + ih * input_w;
                        int kh_kernel_w = kh * kernel_w;

                        for (int kw = 0; kw < kernel_w; ++kw) {
                            int w_idx  = out_oc_ch_size + ic_weight_size + kh_kernel_w + kw;
                            float w_val = weight_ptr[w_idx];

                            for (int ow = 0; ow < output_w; ++ow) {
                                acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
                            }
                        }
                    }
                }   
                int out_row = out_b_ch_size + out_oc_size + oh * output_w;
                for (int ow = 0; ow < output_w; ++ow) {
                    out_ptr[out_row + ow] = acc[ow];
                }
            }
        }
    }
}

template <int OC_T, int OW_PAD>
static inline void conv_row_tile(const float* __restrict in_batch,
                                 const float* __restrict weight_ptr,
                                 const float* __restrict bias_ptr,
                                 float* __restrict out_batch,
                                 int oc0, int oh,
                                 int in_channels, int in_size, int input_w,
                                 int kernel_h, int kernel_w,
                                 int weight_size, int weight_ch_size,
                                 int output_w, int out_size)
{
    float acc[OC_T][OW_PAD];
    for (int t = 0; t < OC_T; ++t) {
        const float bv = bias_ptr[oc0 + t];
        for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
    }

    const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;

    for (int ic = 0; ic < in_channels; ++ic) {
        const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
        const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;

        for (int kh = 0; kh < kernel_h; ++kh) {
            const float* __restrict in_row = in_c + (std::size_t)(oh + kh) * input_w;
            const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;

            for (int kw = 0; kw < kernel_w; ++kw) {
                float wv[OC_T];
                for (int t = 0; t < OC_T; ++t)
                    wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];

                const float* __restrict x = in_row + kw;

                for (int v = 0; v < OW_PAD; ++v) {   // constant trip count
                    const float xv = x[v];           // ONE contiguous load
                    for (int t = 0; t < OC_T; ++t)   // OC_T independent FMAs
                        acc[t][v] += xv * wv[t];
                }
            }
        }
    }

    for (int t = 0; t < OC_T; ++t) {
        float* __restrict o = out_batch
                            + (std::size_t)(oc0 + t) * out_size
                            + (std::size_t)oh * output_w;
        for (int v = 0; v < OW_PAD; ++v)
            if (v < output_w) o[v] = acc[t][v];
    }
}

template <int OW_PAD, int OC_TILE>
static void conv2d_blocked_impl(const float* __restrict input_ptr,
                                const float* __restrict weight_ptr,
                                const float* __restrict bias_ptr,
                                float* __restrict out_ptr,
                                int batches, int in_channels, int out_channels,
                                int input_h, int input_w,
                                int kernel_h, int kernel_w,
                                int output_h, int output_w)
{
    const int in_size        = input_h * input_w;
    const int in_ch_size     = in_channels * in_size;
    const int out_size       = output_h * output_w;
    const int out_ch_size    = out_channels * out_size;
    const int weight_size    = kernel_h * kernel_w;
    const int weight_ch_size = in_channels * weight_size;

    for (int b = 0; b < batches; ++b) {
        const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
        float*       __restrict out_b = out_ptr   + (std::size_t)b * out_ch_size;

        for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
            int oc0 = 0;                               // stay hot across all oc
            for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
                conv_row_tile<OC_TILE, OW_PAD>(
                    in_b, weight_ptr, bias_ptr, out_b, oc0, oh,
                    in_channels, in_size, input_w, kernel_h, kernel_w,
                    weight_size, weight_ch_size, output_w, out_size);

            for (; oc0 < out_channels; ++oc0)          // remainder channels
                conv_row_tile<1, OW_PAD>(
                    in_b, weight_ptr, bias_ptr, out_b, oc0, oh,
                    in_channels, in_size, input_w, kernel_h, kernel_w,
                    weight_size, weight_ch_size, output_w, out_size);
        }
    }
}

static void conv2d_specialized_reference(const Tensor& input, const Tensor& weight,
                                         const Tensor& bias, Tensor& output)
{
    const float* ip = input.data.data();
    const float* wp = weight.data.data();
    const float* bp = bias.data.data();
    float*       op = output.data.data();

    const int OC = weight.batches, IC = weight.channels;
    const int KH = weight.height,  KW = weight.width;

    for (int b = 0; b < input.batches; ++b)
      for (int oc = 0; oc < OC; ++oc)
        for (int oh = 0; oh < output.height; ++oh)
          for (int ow = 0; ow < output.width; ++ow) {
            float s = bp[oc];
            for (int ic = 0; ic < IC; ++ic)
              for (int kh = 0; kh < KH; ++kh)
                for (int kw = 0; kw < KW; ++kw)
                  s += ip[((std::size_t)b * IC + ic) * input.height * input.width
                          + (std::size_t)(oh + kh) * input.width + (ow + kw)]
                     * wp[((std::size_t)oc * IC + ic) * KH * KW
                          + (std::size_t)kh * KW + kw];
            op[((std::size_t)b * output.channels + oc) * output.height * output.width
               + (std::size_t)oh * output.width + ow] = s;
          }
}

void conv2d_forward_specialized_blocked(const Tensor& input, const Tensor& weight,
                                const Tensor& bias, Tensor& output)
{
    const int OC = weight.batches, IC = weight.channels;
    const int KH = weight.height,  KW = weight.width;
    const int IH = input.height,   IW = input.width;
    const int OH = output.height,  OW = output.width;

    assert(input.channels  == IC);
    assert(output.channels == OC);
    assert(output.batches  == input.batches);
    assert((int)bias.data.size() >= OC);
    assert(OH == IH - KH + 1);         
    assert(OW == IW - KW + 1);

    if (OW > 28) { conv2d_specialized_reference(input, weight, bias, output); return; }

    const int OW_PAD = ((OW + 3) / 4) * 4;

    const std::size_t numel = (std::size_t)input.batches * IC * IH * IW;
    const std::size_t slack = (std::size_t)(OW_PAD - OW);
    const float* in_ptr = input.data.data();
    std::vector<float> padded;
    if (slack && input.data.size() < numel + slack) {
        padded.assign(input.data.begin(), input.data.end());
        padded.resize(numel + slack, 0.0f);
        in_ptr = padded.data();
    }

    const float* wp = weight.data.data();
    const float* bp = bias.data.data();
    float*       op = output.data.data();

    #define DISPATCH(PAD, TILE)                                        \
        conv2d_blocked_impl<PAD, TILE>(in_ptr, wp, bp, op,             \
            input.batches, IC, OC, IH, IW, KH, KW, OH, OW); break;

    switch (OW_PAD) {
        case 4:  DISPATCH(4,  8)    //  8 accumulator vectors   (conv3: OW=3)
        case 8:  DISPATCH(8,  6)    // 12
        case 12: DISPATCH(12, 4)    // 12                       (conv2: OW=11)
        case 16: DISPATCH(16, 3)    // 12
        case 20: DISPATCH(20, 2)    // 10
        case 24: DISPATCH(24, 2)    // 12
        case 28: DISPATCH(28, 2)    // 14                       (conv1: OW=26)
        default: conv2d_specialized_reference(input, weight, bias, output);
    }
    #undef DISPATCH
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

