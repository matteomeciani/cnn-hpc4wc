#ifndef CNN_H
#define CNN_H

#include "cnn_internals.h"

struct CNNContext {
        const Tensor& input_batch;
        const Tensor& conv1_weight; const Tensor& conv1_bias; Tensor& conv1_out; Tensor& pool1_out;
        const Tensor& conv2_weight; const Tensor& conv2_bias; Tensor& conv2_out; Tensor& pool2_out;
        const Tensor& conv3_weight; const Tensor& conv3_bias; Tensor& conv3_out; Tensor& avgpool_out;
        const Tensor& fc_weight;    const Tensor& fc_bias;    Tensor& final_logits;
};

/*
 * General function pointer type for CNN forward-pass implementations, useful
 * for benchmarking different implementations with the same interface (mirrors
 * ahe_func in the AHE project).
 */
typedef void (*cnn_func)(CNNContext&);

/*
* CNN forward pass function.
* This function performs a forward pass through a convolutional neural network (CNN) 
* using the provided context. It takes a CNNContext structure as input, which contains 
* references to the input batch, weights, biases, and intermediate tensors for each 
* layer of the CNN. The function executes the following sequence of operations:
* 1. Convolutional Layer 1: Applies a 2D convolution operation using the provided 
*    weights and biases, followed by a ReLU activation function and max pooling.
* 2. Convolutional Layer 2: Similar to the first layer, it applies a 2D convolution,
*    ReLU activation, and max pooling.
* 3. Convolutional Layer 3: Performs a 2D convolution, ReLU activation, and adaptive 
*    average pooling.
* 4. Fully Connected Layer: Applies a linear transformation using the provided weights
*    and biases to produce the final logits.
*
*
* @param ctx A reference to a CNNContext structure containing the input batch, weights,
*
*/

/*
* Simple nested loops implementation of the forward pass of a CNN.
* This function is intended to be used as a baseline for performance comparison.
*/
void cnn_baseline( CNNContext& ctx );

/*
 * Add new optimized forward-pass implementations here as they're written, e.g.:
 *
 *   void cnn_im2col_gemm( CNNContext& ctx );
 *   void cnn_simd_avx2( CNNContext& ctx );
 *
 * and register each one below so it's picked up automatically by the
 * benchmark harness (and, if you build one, by a correctness-verification
 * pass against cnn_baseline).
 */

/*
 * cnn_baseline_autovec
 * the gcc flag -fopt-info-vec-missed flagged the innermost accumulation
 * (pixel_value += input * weight) as unvectorizable for two reasons:
 *
 * 1. "control flow in loop" — the bounds check on (ih, iw) sits inside the
 *    innermost loop. 
 *    a) Since padding == 0, the valid (oh, ow, kh, kw) range
 *    can be derived so (ih, iw) are always in-bounds
 *    b) The valid (oh, ow, kh, kw) range is being hardcoded in the architecture 
 *       (via stride and dimensions) -> RELIES ON MANUAL SIZING
 * 
 *   -> we can drop check entirely instead of just disabling it
 *     -> use conv2d_forward_noboundcheck
 * 
 *    TODO!!
 *     remove boundary checks also for other files, not only conv2d_forward
 *
 * 2. "reduction: unsafe fp math" — pixel_value += is a float reduction, and
 *    float addition isn't associative, so GCC won't reorder/vectorize it
 *    without permission. Applied via a function-local
 *    __attribute__((optimize("associative-math", ...))) so cnn_baseline
 *    stays flag-free as the reference implementation.
 */
void cnn_baseline_autovec( CNNContext& ctx );


/*
 * Reorder loop such that output channel (oc), which is constant in the 
 * input and kernel arguments, varies slower than ow and oh, so these can
 * stay constant 
*/
void cnn_baseline_blocked( CNNContext& ctx );



/*
 * Forward pass using im2col / im2col matrix multiplication.
 */
void cnn_im2col( CNNContext& ctx );


/*
 * Register implementations here to include them in benchmarking. Each entry
 * is (function, display_name), matching the AHE_IMPLEMENTATIONS pattern.
 */
#define CNN_IMPLEMENTATIONS(APPLY) \
    APPLY(cnn_baseline, "Baseline Nested-Loop") \
    APPLY(cnn_baseline_blocked, "Baseline w. blocking") \
    APPLY(cnn_baseline_autovec, "Baseline w. full auto-vectorization") \
    APPLY(cnn_im2col, "Baseline w. im2col matrix multiplication")
    
#endif