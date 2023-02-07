#!/bin/bash
# Batch script for running serial Python code on Kebnekaise
# Loading Python and various scientific packages 
#SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.9.5 and compatible SciPy-bundle
module load GCC/10.3.0  OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05

# Run your Python script
python <my_program.py>
