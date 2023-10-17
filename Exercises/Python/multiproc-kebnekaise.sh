#!/bin/bash
# Batch script for running the numba program "add-list.py" on Kebnekaise
#SBATCH -A hpc2n2023-110 # Remember to change this to your own project ID
# We are asking for 5 minutes
#SBATCH --time=00:05:00
#SBATCH -n 4

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load Python/3.9.5 

# Run your Python script
python multiproc.py
