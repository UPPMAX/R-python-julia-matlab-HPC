#!/bin/bash
# A batch script for running the program parallel_foreach.R on Rackham
#SBATCH -A naiss2023-22-44
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4

ml purge > /dev/null 2>&1
ml R_packages/4.0.4

# Batch script to submit the R program parallel_foreach.R
R -q --slave -f parallel_foreach.R
