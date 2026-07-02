# CNN Forward-Pass: C++ vs PyTorch

**HPC4WC Project** | Matteo, Nicola, Ari

## Description

Implementation of the forward-pass of a convolutional neural network (variable width, depth, and channels) in a compiled language (C/C++/Fortran), benchmarked against PyTorch. Ported to GPU and optimized for performance.

## Team

| Name   | Contribution |
|--------|-------------|
| Matteo | TBD |
| Nicola | TBD |
| Ari    | TBD |


# CSCS Santis — Python Environment Setup Guide

This guide walks you through setting up the Python environment on Santis and running the project.
Do this once. After that, just use `make`.

---

## 1. Find the latest PyTorch uenv

```bash
uenv image ls
```

Look for the latest `pytorch` entry, e.g. `pytorch/v2.9.1:v2`. Use that tag in the steps below.

---

## 2. Start the uenv interactively

```bash
uenv start pytorch/v2.9.1:v2 --view=default
```

You are now inside the uenv shell.

---

## 3. Create the virtual environment

```bash
unset PYTHONPATH
export PYTHONUSERBASE="$(dirname "$(dirname "$(which python)")")"
python -m venv --system-site-packages ~/venvs/venv
```

This creates a venv on top of the uenv so you can install extra packages without hitting the
read-only filesystem. Do this only once.

---

## 4. Activate the venv and install dependencies

```bash
source ~/venvs/venv/bin/activate
pip install -r requirements.txt
```

---

## 5. Verify the install

```bash
python -c "import torchvision, sklearn; print('all good')"
```

---

## 6. Deactivate the venv and exit the uenv

```bash
deactivate
exit
```

You are now back to your normal shell.

---

## 7. Submit jobs with make

```bash
make help              # see all available targets
make submit-pytorch    # submit GPU job to Slurm
make logs              # tail the latest log file
make clean             # remove logs and saved model checkpoints
```

The sbatch scripts handle activating the uenv and venv automatically for each job.

---

## Notes

- The venv is tied to this specific uenv version. If the uenv changes, recreate the venv.
- Never run `pip install` directly inside the uenv without activating the venv first — the
  uenv filesystem is read-only and the install will fail.
- Jobs are always submitted from the repo root (`cnn-hpc4wc/`).



## Starting the C++ Implementation

The benchmark.cpp file is set up to mirror both the network architecture defined in model.py 
and the execution script verify.py. 

The goal of this setup is to prove that our custom C++ forward pass is mathematically 
identical to the PyTorch implementation. Both scripts execute the complete forward pass 
using the exact same binary weights and the same raw MNIST test image.

As shown below, both versions assign the exact same raw final scores (logits) to classes 0 through 9. 
The slight variations beyond the 4th decimal place might come down to `std::cout` only printing
6 significant digits by default and beyond that, floating-point precision differences between 
PyTorch's backend and standard C++ implementations.

Pytorch model logits for the MNIST test image:
```
Python Raw Logits:
Class 0: -4.310458660125732
Class 1: -0.5118204951286316
Class 2: 3.109337329864502
Class 3: 0.44217315316200256
Class 4: -2.627026081085205
Class 5: -5.286825656890869
Class 6: -22.92879295349121
Class 7: 12.553877830505371
Class 8: -3.124603509902954
Class 9: 2.7406351566314697
```

C++ model logits for the MNIST test image: 

```
Raw Logits (Computational Verification):
Class 0: -4.31046
Class 1: -0.511821
Class 2: 3.10934
Class 3: 0.442172
Class 4: -2.62703
Class 5: -5.28683
Class 6: -22.9288
Class 7: 12.5539
Class 8: -3.1246
Class 9: 2.74064
```

## Compiling the C++ Program on Santis

In the terminal (you need to be in the correct folder src/cpp) run:

`g++ -O3 -mcpu=native benchmark.cpp -o cnn_forward`

`-O3` is a flag that tells the compiler to heavily optimize the math for speed.

`-mcpu=native` is meant to unlock Säntis CPU ARM advanced vector extensions to speed up matrix math.


## Running the C++ Program on Santis

Our project account name is `hpc4wc-course2026-ethz`

Run the program `cnn_forward` with the terminal command:

`srun -A hpc4wc-course2026-ethz --partition=normal --time=00:05:00 --ntasks=1 ./cnn_forward`

For bigger jobs (later) use `sbatch` together with an `.sh` script instead of `srun`.