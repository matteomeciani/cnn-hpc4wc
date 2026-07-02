#include "include/cnn_internals.h"

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

void load_binary_weights(const std::string& filepath, std::vector<float>& target_vector) {
    std::ifstream file(filepath, std::ios::binary | std::ios::ate);
    if (!file.is_open())
        throw std::runtime_error("The file could not be opened: " + filepath);

    std::streamsize size = file.tellg();
    if (size != static_cast<std::streamsize>(target_vector.size() * sizeof(float)))
        throw std::runtime_error("File size mismatch for: " + filepath);

    file.seekg(0, std::ios::beg);
    if (file.read(reinterpret_cast<char*>(target_vector.data()), size))
        std::cout << Color::DIM_GREEN << "Successfully loaded: " << filepath << Color::RESET << "\n";
    else
        throw std::runtime_error("Read error: " + filepath);
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

int get_prediction(const Tensor& logits) {
    int   best_class = 0;
    float max_score  = logits.data[0];
    for (int i = 1; i < logits.width; ++i) {
        if (logits.data[i] > max_score) {
            max_score  = logits.data[i];
            best_class = i;
        }
    }
    return best_class;
}

int reverse_int(int i) {
    unsigned char c1 = i & 255;
    unsigned char c2 = (i >> 8)  & 255;
    unsigned char c3 = (i >> 16) & 255;
    unsigned char c4 = (i >> 24) & 255;
    return ((int)c1 << 24) + ((int)c2 << 16) + ((int)c3 << 8) + c4;
}

void load_mnist_images(const std::string& filepath, Tensor& images_tensor, int num_images_to_load) {
    std::ifstream file(filepath, std::ios::binary);
    if (!file.is_open())
        throw std::runtime_error("The MNIST image file could not be opened: " + filepath);

    int magic_number = 0, number_of_images = 0, n_rows = 0, n_cols = 0;
    file.read((char*)&magic_number,      sizeof(magic_number));      magic_number      = reverse_int(magic_number);
    file.read((char*)&number_of_images,  sizeof(number_of_images));  number_of_images  = reverse_int(number_of_images);
    file.read((char*)&n_rows,            sizeof(n_rows));             n_rows            = reverse_int(n_rows);
    file.read((char*)&n_cols,            sizeof(n_cols));             n_cols            = reverse_int(n_cols);

    int images_to_read = std::min(num_images_to_load, number_of_images);
    images_tensor = {std::vector<float>(images_to_read * n_rows * n_cols),
                     images_to_read, 1, n_rows, n_cols};

    for (int i = 0; i < images_to_read * n_rows * n_cols; ++i) {
        unsigned char pixel = 0;
        file.read((char*)&pixel, sizeof(pixel));
        images_tensor.data[i] = static_cast<float>(pixel) / 255.0f;
    }
}

void print_ascii_image(const Tensor& images_tensor, int batch_index) {
    int size      = images_tensor.height * images_tensor.width;
    int start_idx = batch_index * size;

    std::cout << Color::CYAN << "\nVisualizing image at index " << batch_index << ":" << Color::RESET << "\n";
    for (int r = 0; r < images_tensor.height; ++r) {
        for (int c = 0; c < images_tensor.width; ++c) {
            float pixel = images_tensor.data[start_idx + r * images_tensor.width + c];
            if      (pixel > 0.5f) std::cout << Color::BOLD << "##" << Color::RESET;
            else if (pixel > 0.2f) std::cout << Color::DIM  << ".." << Color::RESET;
            else                   std::cout << "  ";
        }
        std::cout << "\n";
    }
    std::cout << "\n";
}
