#include "cnn_helpers.h"

// ---------------------------------------------------------
// HELPER IMPLEMENTATIONS
// ---------------------------------------------------------

// The 2D convolution math is implemented using naive nested loops.
void conv2d_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output, 
                    int stride, int padding) {
    
    int out_channels = weight.batches; 
    int in_channels = weight.channels;
    int kernel_h = weight.height;
    int kernel_w = weight.width;

    // The entire output array is initialized to zero.
    std::fill(output.data.begin(), output.data.end(), 0.0f);

    // The batch items are iterated over.
    for (int b = 0; b < input.batches; ++b) {
        // The output channels (feature maps) are iterated over.
        for (int oc = 0; oc < out_channels; ++oc) {
            // The spatial dimensions of the output image are iterated over.
            for (int oh = 0; oh < output.height; ++oh) {
                for (int ow = 0; ow < output.width; ++ow) {
                    
                    float pixel_value = bias.data[oc];

                    // The input channels and kernel weights are accumulated.
                    for (int ic = 0; ic < in_channels; ++ic) {
                        for (int kh = 0; kh < kernel_h; ++kh) {
                            for (int kw = 0; kw < kernel_w; ++kw) {
                                
                                int ih = oh * stride - padding + kh;
                                int iw = ow * stride - padding + kw;

                                // Boundary bounds are checked.
                                if (ih >= 0 && ih < input.height && iw >= 0 && iw < input.width) {
                                    
                                    // 1D indices are calculated for the flat arrays.
                                    int in_idx = b * (input.channels * input.height * input.width) + 
                                                 ic * (input.height * input.width) + 
                                                 ih * input.width + iw;
                                                 
                                    int w_idx = oc * (weight.channels * weight.height * weight.width) + 
                                                ic * (weight.height * weight.width) + 
                                                kh * weight.width + kw;

                                    pixel_value += input.data[in_idx] * weight.data[w_idx];
                                }
                            }
                        }
                    }
                    
                    // The calculated pixel is saved to the output tensor.
                    int out_idx = b * (output.channels * output.height * output.width) + 
                                  oc * (output.height * output.width) + 
                                  oh * output.width + ow;
                    output.data[out_idx] = pixel_value;
                }
            }
        }
    }
}

// The ReLU activation is applied in-place.
void relu_forward(Tensor& tensor) {
    int total_elements = tensor.batches * tensor.channels * tensor.height * tensor.width;
    
    // Every element is checked and negative values are clamped to zero.
    for (int i = 0; i < total_elements; ++i) {
        if (tensor.data[i] < 0.0f) {
            tensor.data[i] = 0.0f;
        }
    }
}

// The Dense/Linear layer is implemented as a matrix-vector multiplication.
void linear_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output) {
    int in_features = weight.width;
    int out_features = weight.height;

    std::fill(output.data.begin(), output.data.end(), 0.0f);

    // Each batch item is processed.
    for (int b = 0; b < input.batches; ++b) {
        // Each output neuron is processed.
        for (int out_f = 0; out_f < out_features; ++out_f) {
            
            float neuron_value = bias.data[out_f];
            
            // The dot product with the input vector is computed.
            for (int in_f = 0; in_f < in_features; ++in_f) {
                int in_idx = b * in_features + in_f;
                int w_idx = out_f * in_features + in_f;
                neuron_value += input.data[in_idx] * weight.data[w_idx];
            }
            
            int out_idx = b * out_features + out_f;
            output.data[out_idx] = neuron_value;
        }
    }
}

// A binary file is read directly into a pre-allocated flat vector.
void load_binary_weights(const std::string& filepath, std::vector<float>& target_vector) {
    // The file is opened in binary mode, starting at the end to quickly gauge file size.
    std::ifstream file(filepath, std::ios::binary | std::ios::ate);
    
    if (!file.is_open()) {
        throw std::runtime_error("The file could not be opened: " + filepath);
    }
    
    // The file size is calculated.
    std::streamsize size = file.tellg();
    
    // A check is performed to ensure the file size matches the pre-allocated vector size.
    if (size != target_vector.size() * sizeof(float)) {
        throw std::runtime_error("The file size does not match the allocated tensor size for: " + filepath);
    }
    
    // The file stream is rewound to the beginning.
    file.seekg(0, std::ios::beg);
    
    // The raw binary data is read directly into the memory block of the vector.
    if (file.read(reinterpret_cast<char*>(target_vector.data()), size)) {
        std::cout << "Successfully loaded: " << filepath << std::endl;
    } else {
        throw std::runtime_error("An error occurred while reading: " + filepath);
    }
}

// 2D Max Pooling is applied.
void maxpool2d_forward(const Tensor& input, Tensor& output, int pool_size, int stride) {
    // The tensor is initialized with very small numbers.
    std::fill(output.data.begin(), output.data.end(), -1e9f); 

    for (int b = 0; b < input.batches; ++b) {
        for (int c = 0; c < input.channels; ++c) {
            for (int oh = 0; oh < output.height; ++oh) {
                for (int ow = 0; ow < output.width; ++ow) {
                    
                    float max_val = -1e9f;
                    
                    // The pooling window is scanned.
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

// Adaptive Average Pooling (to 1x1) is applied.
void adaptive_avgpool2d_forward(const Tensor& input, Tensor& output) {
    std::fill(output.data.begin(), output.data.end(), 0.0f);
    int spatial_size = input.height * input.width;

    for (int b = 0; b < input.batches; ++b) {
        for (int c = 0; c < input.channels; ++c) {
            float sum = 0.0f;
            
            // All pixels in the channel are summed.
            for (int i = 0; i < spatial_size; ++i) {
                int in_idx = b * (input.channels * spatial_size) + c * spatial_size + i;
                sum += input.data[in_idx];
            }
            
            // The average is calculated and stored.
            int out_idx = b * input.channels + c;
            output.data[out_idx] = sum / spatial_size;
        }
    }
}

// The predicted class (0-9) is determined by finding the index of the highest value.
int get_prediction(const Tensor& logits) {
    int best_class = 0;
    float max_score = logits.data[0];
    
    for (int i = 1; i < logits.width; ++i) { 
        if (logits.data[i] > max_score) {
            max_score = logits.data[i];
            best_class = i;
        }
    }
    return best_class;
}

// ---------------------------------------------------------
// MNIST DATA LOADING HELPERS
// ---------------------------------------------------------

// An integer is converted from Big-Endian to Little-Endian.
int reverse_int(int i) {
    unsigned char c1, c2, c3, c4;
    c1 = i & 255;
    c2 = (i >> 8) & 255;
    c3 = (i >> 16) & 255;
    c4 = (i >> 24) & 255;
    return ((int)c1 << 24) + ((int)c2 << 16) + ((int)c3 << 8) + c4;
}

// The MNIST image file is parsed and loaded into a flat Tensor.
void load_mnist_images(const std::string& filepath, Tensor& images_tensor, int num_images_to_load) {
    // The binary file is opened.
    std::ifstream file(filepath, std::ios::binary);
    if (!file.is_open()) {
        throw std::runtime_error("The MNIST image file could not be opened: " + filepath);
    }

    int magic_number = 0;
    int number_of_images = 0;
    int n_rows = 0;
    int n_cols = 0;

    // The header is read and endianness is reversed.
    file.read((char*)&magic_number, sizeof(magic_number));
    magic_number = reverse_int(magic_number);
    file.read((char*)&number_of_images, sizeof(number_of_images));
    number_of_images = reverse_int(number_of_images);
    file.read((char*)&n_rows, sizeof(n_rows));
    n_rows = reverse_int(n_rows);
    file.read((char*)&n_cols, sizeof(n_cols));
    n_cols = reverse_int(n_cols);

    // Memory is allocated for the requested number of images.
    int images_to_read = std::min(num_images_to_load, number_of_images);
    images_tensor.batches = images_to_read;
    images_tensor.channels = 1;
    images_tensor.height = n_rows;
    images_tensor.width = n_cols;
    int total_pixels = images_to_read * n_rows * n_cols;
    images_tensor.data.resize(total_pixels);

    // The pixel data is read and converted to float for normalization.
    for (int i = 0; i < total_pixels; ++i) {
        unsigned char pixel = 0;
        file.read((char*)&pixel, sizeof(pixel));
        images_tensor.data[i] = (float)pixel / 255.0f; 
    }
}

// A single MNIST image is printed to the console using ASCII art for visual verification.
void print_ascii_image(const Tensor& images_tensor, int batch_index) {
    int size = images_tensor.height * images_tensor.width;
    int start_idx = batch_index * size;
    
    std::cout << "\nVisualizing image at index " << batch_index << ":\n";
    for (int r = 0; r < images_tensor.height; ++r) {
        for (int c = 0; c < images_tensor.width; ++c) {
            float pixel = images_tensor.data[start_idx + r * images_tensor.width + c];
            if (pixel > 0.5f) std::cout << "##";
            else if (pixel > 0.2f) std::cout << "..";
            else std::cout << "  ";
        }
        std::cout << "\n";
    }
    std::cout << "\n";
}

// ---------------------------------------------------------
// EXECUTION ENTRY POINT
// ---------------------------------------------------------

int main() {
    // Only 1 image is processed for the baseline test.
    int batch_size = 1; 
    int num_classes = 10;
    
    std::cout << "Memory allocation is starting..." << std::endl;

    // 1. INPUT DATA ALLOCATION & LOADING
    Tensor input_batch;
    
    // The actual MNIST test images are loaded.
    try {
        // The path now points to the new raw data directory.
        std::string mnist_path = "../../data/MNIST/raw/t10k-images-idx3-ubyte"; 
        load_mnist_images(mnist_path, input_batch, batch_size);
        std::cout << "MNIST dataset successfully loaded." << std::endl;
    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
        return 1;
    }

    // The loaded image is visualized in the terminal.
    print_ascii_image(input_batch, 0);

    // 2. WEIGHTS AND BIASES ALLOCATION & LOADING
    std::cout << "\nLoading real weights..." << std::endl;

    // The base directory path for the weights is defined.
    std::string w_path = "../python/weights_cpp/";

    // Layer 1 (Sequential Index 0) weights and biases are allocated and loaded.
    Tensor conv1_weight = {std::vector<float>(32 * 1 * 3 * 3), 32, 1, 3, 3};
    load_binary_weights(w_path + "model_0_weight.bin", conv1_weight.data);
    Tensor conv1_bias = {std::vector<float>(32), 32, 1, 1, 1};
    load_binary_weights(w_path + "model_0_bias.bin", conv1_bias.data);
    
    // Layer 2 (Sequential Index 3) weights and biases are allocated and loaded.
    Tensor conv2_weight = {std::vector<float>(64 * 32 * 3 * 3), 64, 32, 3, 3};
    load_binary_weights(w_path + "model_3_weight.bin", conv2_weight.data);
    Tensor conv2_bias = {std::vector<float>(64), 64, 1, 1, 1};
    load_binary_weights(w_path + "model_3_bias.bin", conv2_bias.data);

    // Layer 3 (Sequential Index 6) weights and biases are allocated and loaded.
    Tensor conv3_weight = {std::vector<float>(128 * 64 * 3 * 3), 128, 64, 3, 3};
    load_binary_weights(w_path + "model_6_weight.bin", conv3_weight.data);
    Tensor conv3_bias = {std::vector<float>(128), 128, 1, 1, 1};
    load_binary_weights(w_path + "model_6_bias.bin", conv3_bias.data);

    // Linear Layer (Sequential Index 10) weights and biases are allocated and loaded.
    Tensor fc_weight = {std::vector<float>(num_classes * 128), 1, 1, num_classes, 128}; 
    load_binary_weights(w_path + "model_10_weight.bin", fc_weight.data);
    Tensor fc_bias = {std::vector<float>(num_classes), num_classes, 1, 1, 1};
    load_binary_weights(w_path + "model_10_bias.bin", fc_bias.data);

    // 3. INTERMEDIATE ACTIVATIONS ALLOCATION
    // Output tensors for all layers are pre-allocated.
    Tensor conv1_out = {std::vector<float>(batch_size * 32 * 26 * 26), batch_size, 32, 26, 26};
    Tensor pool1_out = {std::vector<float>(batch_size * 32 * 13 * 13), batch_size, 32, 13, 13};

    Tensor conv2_out = {std::vector<float>(batch_size * 64 * 11 * 11), batch_size, 64, 11, 11};
    Tensor pool2_out = {std::vector<float>(batch_size * 64 * 5 * 5), batch_size, 64, 5, 5};

    Tensor conv3_out = {std::vector<float>(batch_size * 128 * 3 * 3), batch_size, 128, 3, 3};
    Tensor avgpool_out = {std::vector<float>(batch_size * 128 * 1 * 1), batch_size, 128, 1, 1};

    Tensor final_logits = {std::vector<float>(batch_size * num_classes), batch_size, 1, 1, num_classes};

    std::cout << "The full machine learning forward pass is starting..." << std::endl;

    // --- LAYER 1 ---
    conv2d_forward(input_batch, conv1_weight, conv1_bias, conv1_out, 1, 0);
    relu_forward(conv1_out);
    maxpool2d_forward(conv1_out, pool1_out, 2, 2);

    // --- LAYER 2 ---
    conv2d_forward(pool1_out, conv2_weight, conv2_bias, conv2_out, 1, 0);
    relu_forward(conv2_out);
    maxpool2d_forward(conv2_out, pool2_out, 2, 2);

    // --- LAYER 3 ---
    conv2d_forward(pool2_out, conv3_weight, conv3_bias, conv3_out, 1, 0);
    relu_forward(conv3_out);
    adaptive_avgpool2d_forward(conv3_out, avgpool_out); 

    // --- FLATTEN & LINEAR ---
    linear_forward(avgpool_out, fc_weight, fc_bias, final_logits);

    // --- LOGITS VERIFICATION ---
    std::cout << "\nRaw Logits (Computational Verification):" << std::endl;
    for (int i = 0; i < num_classes; ++i) {
        std::cout << "Class " << i << ": " << final_logits.data[i] << std::endl;
    }

    // --- PREDICTION ---
    int predicted_digit = get_prediction(final_logits);
    std::cout << "\nThe network has successfully predicted the digit: " << predicted_digit << std::endl;

    return 0;
}