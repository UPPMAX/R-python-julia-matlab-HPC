#!/bin/bash
# Batch script for running mmmult.py on Rackham
#SBATCH -A naiss2023-22-914 # Change to your own project ID after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here Python 3.9.5.
module load python/3.9.5

# Run your Python script
python mmmult.py
