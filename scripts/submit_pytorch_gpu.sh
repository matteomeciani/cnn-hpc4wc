#!/bin/bash
#SBATCH --job-name=mnist_gpu
#SBATCH --account=hpc4wc-course2026-ethz
#SBATCH --partition=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --gpus-per-node=1
#SBATCH --time=00:20:00
#SBATCH --output=logs/%j_mnist_gpu.out
#SBATCH --error=logs/%j_mnist_gpu.err

cd $SLURM_SUBMIT_DIR/src/python

mkdir -p logs

echo "Job ID: $SLURM_JOB_ID"
echo "Node: $SLURMD_NODENAME"
echo "Device: GPU"
echo "Start: $(date)"

VENV="$HOME/venvs/venv"
if [ -f "$VENV/bin/activate" ]; then
    echo "Activating venv: $VENV"
    source "$VENV/bin/activate"
else
    echo "WARNING: venv not found at $VENV, falling back to uenv base"
fi

uenv run pytorch/v2.9.1:v2 --view=default -- python3 train.py --device cuda

echo "End: $(date)"
