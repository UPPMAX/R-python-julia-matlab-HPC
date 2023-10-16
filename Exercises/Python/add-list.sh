#!/bin/bash
# Batch script for running the numba program "add-list.py" on Kebnekaise
#SBATCH -A hpc2n2023-110 # Remember to change this to your own project ID
# We are asking for 5 minutes
#SBATCH --time=00:05:00
# Asking for one V100
#SBATCH --gres=gpu:v100:1

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/10.3.0  OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05 CUDA/11.3.1

# Activate the virtual environment we installed to (change to your path and venv dir name)
source /proj/nobackup/support-hpc2n/bbrydsoe/Example-cuda/bin/activate

# Run your Python script
python add-list.py
