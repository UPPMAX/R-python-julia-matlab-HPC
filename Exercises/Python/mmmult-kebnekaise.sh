#!/bin/bash
# Batch script for running mmmult.py on Kebnekaise
#SBATCH -A hpc2nXXXX-YYY # Change to your own project ID 
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here Python 3.9.5 and prerequisites.
module load GCC/10.3.0  OpenMPI/4.1.1 Python/3.9.5

# Run your Python script
python mmmult.py
