#!/bin/bash
# Serial batch script for Python, Scientific Python packages, and loading your virtual environment
#SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.9.5 and compatible SciPy-bundle
module load GCC/10.3.0  OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05

# Activate your virtual environment. Note that you either need to have added the location to your path, or give the full path
source <path-to-virt-env>/bin/activate

# Run your Python script
python <my_program.py>
