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

NUM_RUNS="${NUM_RUNS:-10}"
NUM_WARMUP_RUNS="${NUM_WARMUP_RUNS:-2}"
VENV="$HOME/venvs/venv"


uenv run --view=default pytorch/v2.9.1:v2 -- bash -c "
  echo '=== C++ Compiler Version ==='
  g++ --version | head -n1
  
  make build NUM_RUNS=$NUM_RUNS NUM_WARMUP_RUNS=$NUM_WARMUP_RUNS
  cd src/cpp && ../../build/cnn_forward
"


uenv run --view=default pytorch/v2.9.1:v2 -- bash -c "
  source $VENV/bin/activate
  cd src/python
  python3 benchmark.py --num-runs $NUM_RUNS --num-warmup-runs $NUM_WARMUP_RUNS
"

echo "End:     $(date)"