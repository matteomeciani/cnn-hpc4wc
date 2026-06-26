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
make help          # see all available targets
make submit-cpu    # submit CPU job to Slurm
make submit-gpu    # submit GPU job to Slurm
make logs          # tail the latest log file
make clean         # remove logs and saved model checkpoints
```

The sbatch scripts handle activating the uenv and venv automatically for each job.

---

## Notes

- The venv is tied to this specific uenv version. If the uenv changes, recreate the venv.
- Never run `pip install` directly inside the uenv without activating the venv first — the
  uenv filesystem is read-only and the install will fail.
- Jobs are always submitted from the repo root (`cnn-hpc4wc/`).