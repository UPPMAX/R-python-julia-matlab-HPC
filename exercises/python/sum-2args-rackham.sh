#!/bin/bash
#SBATCH -A naiss2023-22-914 # Change to your own ID after the course
#SBATCH --time=00:05:00 # Asking for 5 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.9.5
module load Python/3.9.5

# Run your Python script
python sum-2args.py 2 3
