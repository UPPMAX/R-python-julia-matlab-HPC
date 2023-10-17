#!/bin/bash
# Batch script for running the numba program "add-list.py" on Kebnekaise
#SBATCH -A naiss2023-22-914 # Remember to change this to your own project ID
# We are asking for 5 minutes
#SBATCH --time=00:05:00
#SBATCH -n 4

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load python/3.9.5 

# Run your Python script
python multiproc.py
