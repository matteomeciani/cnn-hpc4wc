import struct
import numpy as np
import torch
from model import CNN

def load_bin(filepath, shape):
    '''
      A binary file is read and reshaped into a PyTorch tensor.
    '''
    data = np.fromfile(filepath, dtype=np.float32)
    return torch.tensor(data).view(shape)

# 1. The model is initialized.
model = CNN(in_channels=1, num_classes=10)
model.eval()

# 2. Binary weights are loaded back into PyTorch to guarantee identical state.
w_path = 'weights_cpp/'

with torch.no_grad():
    model.model[0].weight.copy_(load_bin(w_path + 'model_0_weight.bin', (32, 1, 3, 3)))
    model.model[0].bias.copy_(load_bin(w_path + 'model_0_bias.bin', (32,)))

    model.model[3].weight.copy_(load_bin(w_path + 'model_3_weight.bin', (64, 32, 3, 3)))
    model.model[3].bias.copy_(load_bin(w_path + 'model_3_bias.bin', (64,)))

    model.model[6].weight.copy_(load_bin(w_path + 'model_6_weight.bin', (128, 64, 3, 3)))
    model.model[6].bias.copy_(load_bin(w_path + 'model_6_bias.bin', (128,)))

    model.model[10].weight.copy_(load_bin(w_path + 'model_10_weight.bin', (10, 128)))
    model.model[10].bias.copy_(load_bin(w_path + 'model_10_bias.bin', (10,)))

# 3. The full MNIST test split is loaded directly from the IDX file.
mnist_path = '../../data/MNIST/raw/t10k-images-idx3-ubyte'

with open(mnist_path, 'rb') as f:
    magic, num, rows, cols = struct.unpack(">IIII", f.read(16))
    image_data = np.frombuffer(f.read(num * rows * cols), dtype=np.uint8)

image_tensor = torch.tensor(image_data, dtype=torch.float32).view(num, 1, rows, cols) / 255.0

# 4. The PyTorch forward pass is executed over all images.
with torch.no_grad():
    torch_logits = model(image_tensor).numpy()  # (num, 10)

# 5. The C++ logits are loaded and compared.
cpp_logits = np.fromfile('weights_cpp/cpp_logits.bin', dtype=np.float32).reshape(num, 10)

max_abs_diff = np.max(np.abs(torch_logits - cpp_logits))
torch_pred = torch_logits.argmax(axis=1)
cpp_pred = cpp_logits.argmax(axis=1)
pred_mismatches = int(np.sum(torch_pred != cpp_pred))

print(f"Compared {num} images.")
print(f"Max absolute logit difference: {max_abs_diff:.3e}")
print(f"Prediction mismatches:         {pred_mismatches} / {num}")

if np.allclose(torch_logits, cpp_logits, atol=1e-3) and pred_mismatches == 0:
    print("PASS: C++ output matches PyTorch.")
else:
    print("FAIL: C++ output differs from PyTorch.")
