#ifndef CNN_HELPERS_H
#define CNN_HELPERS_H

#include <vector>
#include <iostream>
#include <cmath>
#include <algorithm>
#include <fstream>
#include <stdexcept>

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
// FUNCTION DECLARATIONS
// ---------------------------------------------------------

// A 2D convolution forward pass is declared.
void conv2d_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output, 
                    int stride, int padding);

// A ReLU activation forward pass is declared.
void relu_forward(Tensor& tensor);

// A fully connected (dense) layer forward pass is declared.
void linear_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output);

// A binary file is loaded into a target vector.
void load_binary_weights(const std::string& filepath, std::vector<float>& target_vector);

// A 2D Max Pooling forward pass is declared.
void maxpool2d_forward(const Tensor& input, Tensor& output, int pool_size, int stride);

// Adaptive Average Pooling (to 1x1) is declared.
void adaptive_avgpool2d_forward(const Tensor& input, Tensor& output);

// The predicted class is determined.
int get_prediction(const Tensor& logits);

// An integer is converted from Big-Endian to Little-Endian.
int reverse_int(int i);

// The MNIST image file is parsed and loaded.
void load_mnist_images(const std::string& filepath, Tensor& images_tensor, int num_images_to_load);

// A single MNIST image is printed to the console.
void print_ascii_image(const Tensor& images_tensor, int batch_index);

#endif // CNN_HELPERS_H