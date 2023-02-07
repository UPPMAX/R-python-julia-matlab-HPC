#!/bin/bash
#SBATCH -A hpc2nXXXX-YYY
#SBATCH -t 00:05:00
#SBATCH -N 1
#SBATCH -n 28
#SBATCH -o output_%j.out   # output file
#SBATCH -e error_%j.err    # error messages
#SBATCH --gres=gpu:k80:2
#SBATCH --exclusive

ml purge > /dev/null 2>&1
ml GCCcore/11.2.0 Python/3.9.6
ml GCC/11.2.0 OpenMPI/4.1.1
ml CUDA/11.4.1

virtualenv --system-site-packages /proj/nobackup/<your-project-storage>/vpyenv-python-course
source /proj/nobackup/<your-project-storage>/vpyenv-python-course/bin/activate

python integration2d_gpu.py
