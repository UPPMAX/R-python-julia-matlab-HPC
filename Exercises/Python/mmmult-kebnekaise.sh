#!/bin/bash
# Batch script for running mmmult.py on Kebnekaise
#SBATCH -A hpc2n2023-110 # Change to your own project ID 
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Purge any loaded modules
ml purge > /dev/null 2>&1 

# Load any modules you need, here Python 3.9.5, SciPy-bundle,  and prerequisites.
module load GCC/10.3.0  OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05

# Run your Python script
python mmmult.py
