#!/bin/bash
#SBATCH --job-name=cnn_run
#SBATCH --account=hpc4wc-course2026-ethz
#SBATCH --partition=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=00:10:00
#SBATCH --output=logs/%j_cnn_run.out
#SBATCH --error=logs/%j_cnn_run.err

cd $SLURM_SUBMIT_DIR
mkdir -p logs

echo "Job ID:  $SLURM_JOB_ID"
echo "Node:    $SLURMD_NODENAME"
echo "Start:   $(date)"

make build
cd src/cpp && ../../build/cnn_forward

echo "End:     $(date)"
