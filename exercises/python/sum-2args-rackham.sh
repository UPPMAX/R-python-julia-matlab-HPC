#!/bin/bash
#SBATCH -A naiss2024-22-107 # Change to your own ID after the course
#SBATCH --time=00:05:00 # Asking for 5 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.11.8
module load python/3.11.8

# Run your Python script
python sum-2args.py 2 3
