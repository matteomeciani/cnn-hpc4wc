import argparse
import json
import os
import struct
import time

import numpy as np
import torch

from model import CNN


def load_bin(filepath, shape):
    '''
      A binary file is read and reshaped into a PyTorch tensor.
    '''
    data = np.fromfile(filepath, dtype=np.float32)
    return torch.tensor(data).view(shape)


def print_ascii_image(image_tensor):
    '''
      A single MNIST image (1, 1, H, W) is printed to the console, mirroring
      src/cpp/include/utils.h's print_ascii_image.
    '''
    pixels = image_tensor[0, 0]
    rows, cols = pixels.shape
    print("\nVisualizing the input image:")
    for r in range(rows):
        line = []
        for c in range(cols):
            pixel = pixels[r, c].item()
            if pixel > 0.5:
                line.append("##")
            elif pixel > 0.2:
                line.append("..")
            else:
                line.append("  ")
        print("".join(line))
    print()


def print_comparison(python_time_sec, num_runs, cpp_timing_path):
    '''
      A side-by-side comparison of the C++ and Python median time/cycles is
      printed. C++ numbers come from cpp_timing.json (written by cnn_forward);
      Python does not currently sample hardware cycle counters.
    '''
    cpp_time_sec, cpp_cycles, cpp_impl_name = None, None, None
    if os.path.isfile(cpp_timing_path):
        with open(cpp_timing_path) as f:
            cpp = json.load(f)
        cpp_time_sec = cpp['median_time_sec']
        cpp_cycles = cpp['median_cycles']
        cpp_impl_name = cpp.get('implementation')

    cpp_time_str = f"{cpp_time_sec:.6f} s" if cpp_time_sec is not None else "N/A"
    py_time_str = f"{python_time_sec:.6f} s"
    cpp_cycles_str = f"{cpp_cycles:.0f}" if cpp_cycles else "N/A"
    py_cycles_str = "N/A"

    cpp_label = f"C++ ({cpp_impl_name})" if cpp_impl_name else "C++"
    print(f"\n=== {cpp_label} [fastest] vs Python/PyTorch ({num_runs} runs) ===")
    print(f"{'':16}{cpp_label:>16}{'Python':>16}")
    print(f"{'Time (median)':16}{cpp_time_str:>16}{py_time_str:>16}")
    print(f"{'Cycles (median)':16}{cpp_cycles_str:>16}{py_cycles_str:>16}")

    if cpp_time_sec is None:
        print("\n(C++ timing not found — run ../../build/cnn_forward first to populate "
              "weights_cpp/cpp_timing.json.)")
    elif cpp_time_sec > 0 and python_time_sec > 0:
        if python_time_sec < cpp_time_sec:
            print(f"\nPython is {cpp_time_sec / python_time_sec:.2f}x faster than the fastest "
                  f"C++ implementation (median wall time).")
        else:
            print(f"\nThe fastest C++ implementation is {python_time_sec / cpp_time_sec:.2f}x "
                  f"faster than Python (median wall time).")

    print("Python cycle counts: not available (no hardware cycle counter is sampled from Python).")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--num-runs', type=int, default=10)
    parser.add_argument('--num-warmup-runs', type=int, default=2)
    parser.add_argument('-v', '--verbose', action='store_true',
                         help='Print the ASCII input image and per-class logits.')
    args = parser.parse_args()

    # Single-threaded to match the C++ baseline's single-core loop.
    torch.set_num_threads(1)

    # 1. The model is initialized and the same binary weights used by the
    #    C++ forward pass are loaded back in, to guarantee identical state.
    model = CNN(in_channels=1, num_classes=10)
    model.eval()

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

    # 2. A single MNIST test image is loaded, matching the C++ timing
    #    benchmark's single-image forward pass.
    mnist_path = '../../data/MNIST/raw/t10k-images-idx3-ubyte'
    with open(mnist_path, 'rb') as f:
        _, _, rows, cols = struct.unpack(">IIII", f.read(16))
        image_data = np.frombuffer(f.read(rows * cols), dtype=np.uint8)
    image_tensor = torch.tensor(image_data, dtype=torch.float32).view(1, 1, rows, cols) / 255.0

    if args.verbose:
        print_ascii_image(image_tensor)

    # 3. Warmup runs, then timed runs.
    with torch.no_grad():
        for _ in range(args.num_warmup_runs):
            logits = model(image_tensor)

        run_times = []
        for _ in range(args.num_runs):
            start = time.perf_counter()
            logits = model(image_tensor)
            run_times.append(time.perf_counter() - start)

    # 4. Results.
    if args.verbose:
        print("Raw Logits (Computational Verification):")
        for i, logit in enumerate(logits[0].numpy()):
            print(f"Class {i}: {logit}")
        print()

    predicted_digit = int(logits.argmax(dim=1).item())
    print(f"The network has successfully predicted the digit: {predicted_digit}")

    median_time = float(np.median(run_times))
    print_comparison(median_time, args.num_runs, w_path + 'cpp_timing.json')


if __name__ == '__main__':
    main()
