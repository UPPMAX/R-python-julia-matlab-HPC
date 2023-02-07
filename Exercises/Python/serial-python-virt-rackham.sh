#!/bin/bash
#SBATCH -A naiss2023-22-44 # Change to your own after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.9.5 
module load python/3.9.5

# Activate your virtual environment. 
# CHANGE <path-to-virt-env> to the full path where you installed your virtual environment
source <path-to-virt-env>/bin/activate

# Run your Python script
python <my_program.py>
