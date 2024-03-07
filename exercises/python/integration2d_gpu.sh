#!/bin/bash
#SBATCH -A hpc2n2024-025
#SBATCH -t 00:30:00
#SBATCH -N 1
#SBATCH -n 28
#SBATCH -o output_%j.out   # output file
#SBATCH -e error_%j.err    # error messages
#SBATCH --gres=gpu:v100:2
#SBATCH --exclusive

ml purge > /dev/null 2>&1
module load GCC/10.3.0  OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05 CUDA/11.3.1

python integration2d_gpu.py
python integration2d_gpu_shared.py
