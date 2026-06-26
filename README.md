# CNN Forward-Pass: C++/CUDA vs PyTorch

**HPC4WC Project** | Matteo, Nicola, Ari

## Overview

Implementation of the forward-pass of a convolutional neural network (variable width, depth, and channels) in C++, benchmarked against PyTorch. Extended to GPU via CUDA and optimized for performance on the Santis cluster (CSCS Alps).

## Goals

- Implement CNN forward-pass in C++ (and/or Fortran)
- Compare performance against PyTorch baseline
- Port to GPU using CUDA
- Optimize: memory layout, parallelism, kernel tuning

## Structure

```
.
├── src/
│   ├── cpu/        # C++ CPU implementation
│   ├── gpu/        # CUDA GPU implementation
│   └── reference/  # PyTorch baseline
├── benchmarks/     # Timing and profiling scripts
├── results/        # Performance comparison outputs
└── report/         # Final report
```

## Getting Started

### Prerequisites

- C++17 compiler (GCC or Clang)
- CUDA toolkit
- Python + PyTorch

### Build

```bash
make cpu     # build CPU version
make gpu     # build GPU version
```

### Run benchmarks

```bash
python benchmarks/run_all.py --width 64 --depth 4 --channels 32
```

## Cluster (Santis @ CSCS)

```bash
cscs-key sign
ssh santis
srun -t120 -n1 --pty bash
```

## Results

| Implementation | Device | Time (ms) |
|----------------|--------|-----------|
| C++ (naive)    | CPU    | TBD       |
| C++ (optimized)| CPU    | TBD       |
| CUDA           | GPU    | TBD       |
| PyTorch        | CPU    | TBD       |
| PyTorch        | GPU    | TBD       |

## Team

| Name   | Contribution |
|--------|-------------|
| Matteo | TBD |
| Nicola | TBD |
| Ari    | TBD |
