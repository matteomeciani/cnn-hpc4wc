#ifndef CNN_INTERNALS_H
#define CNN_INTERNALS_H

#include <vector>
#include <algorithm>

// ---------------------------------------------------------
// DATA STRUCTURES
// ---------------------------------------------------------

// A basic structure is defined to hold a multi-dimensional tensor in a flat 1D array.
struct Tensor {
    std::vector<float> data;
    int batches;
    int channels;
    int height;
    int width;
};

// ---------------------------------------------------------
// LAYER FORWARD PASSES
// ---------------------------------------------------------

// A 2D convolution forward pass is declared.
void conv2d_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                    int stride, int padding);

// A 2D convolution forward pass with blocking is declared.
void conv2d_forward_blocked(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                    int stride, int padding);

// A 2D convolution forward pass with no boundary checks is declared.
void conv2d_forward_noboundcheck(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                    int stride, int padding);

// A ReLU activation forward pass is declared.
void relu_forward(Tensor& tensor);

// A fully connected (dense) layer forward pass is declared.
void linear_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output);

// A 2D Max Pooling forward pass is declared.
void maxpool2d_forward(const Tensor& input, Tensor& output, int pool_size, int stride);

// Adaptive Average Pooling (to 1x1) is declared.
void adaptive_avgpool2d_forward(const Tensor& input, Tensor& output);

// A 2D convolution forward pass using im2col / im2col matrix multiplication.
void conv2d_forward_im2col(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output,
                             int stride, int padding);



#endif // CNN_INTERNALS_H
