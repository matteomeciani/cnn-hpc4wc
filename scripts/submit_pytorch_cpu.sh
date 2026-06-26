#!/bin/bash
#SBATCH --job-name=mnist_cpu
#SBATCH --account=hpc4wc-course2026-ethz
#SBATCH --partition=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:20:00
#SBATCH --output=logs/%j_mnist_cpu.out
#SBATCH --error=logs/%j_mnist_cpu.err

mkdir -p $SLURM_SUBMIT_DIR/logs
cd $SLURM_SUBMIT_DIR/src/python

echo "Job ID: $SLURM_JOB_ID"
echo "Node: $SLURMD_NODENAME"
echo "Device: CPU"
echo "Start: $(date)"

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

VENV="$HOME/venvs/venv"

uenv run pytorch/v2.9.1:v2 --view=default -- bash -c "source $VENV/bin/activate && python3 train.py --device cpu"

echo "End: $(date)"