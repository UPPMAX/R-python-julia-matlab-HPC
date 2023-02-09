#!/bin/bash
# A script for running a serial R code on Kebnekaise 
#SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.0.4 and prerequisites
module load GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4

# Run your R script (here 'hello.R')
R --no-save --quiet < hello.R
