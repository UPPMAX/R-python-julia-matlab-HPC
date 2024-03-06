#!/bin/bash
# A batch script for running the R program parallel_foreach.R on Kebnekaise 
#SBATCH -A hpc2n2023-110 # Change to your own project ID
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4

ml purge > /dev/null 2>&1
ml GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4

# Batch script to submit the R program parallel_foreach.R
R -q --slave -f parallel_foreach.R
