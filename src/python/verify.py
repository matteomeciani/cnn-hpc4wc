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

# 3. The exact same MNIST image is loaded directly from the IDX file.
mnist_path = '../../data/MNIST/raw/t10k-images-idx3-ubyte'

with open(mnist_path, 'rb') as f:
    # The 16-byte header is parsed and skipped.
    magic, num, rows, cols = struct.unpack(">IIII", f.read(16))
    
    # Only the very first image is read (28 * 28 = 784 bytes).
    image_data = np.frombuffer(f.read(rows * cols), dtype=np.uint8)
    
    # The pixel data is normalized to match C++.
    image_tensor = torch.tensor(image_data, dtype=torch.float32) / 255.0
    image_tensor = image_tensor.view(1, 1, 28, 28)

# 4. The forward pass is executed up to the second-to-last step.
with torch.no_grad():
    # Sequential indices 0 through 9 encompass everything up to Flatten.
    intermediate_features = model.model[:10](image_tensor)
    
    # The final linear layer is executed.
    final_logits = model.model[10](intermediate_features)

# 5. The outputs are printed for comparison.
print("Python Intermediate Features (First 10 of 128):")
print(intermediate_features[0, :10].numpy())

print("\nPython Raw Logits:")
for i, logit in enumerate(final_logits[0].numpy()):
    print(f"Class {i}: {logit}")