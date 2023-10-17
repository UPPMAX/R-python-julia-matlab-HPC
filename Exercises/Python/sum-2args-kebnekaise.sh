#!/bin/bash
#SBATCH -A hpc2n2023-110 # Change to your own ID
#SBATCH --time=00:05:00 # Asking for 5 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.9.5
module load GCC/10.3.0  OpenMPI/4.1.1 Python/3.9.5

# Run your Python script
python sum-2args.py 2 3
