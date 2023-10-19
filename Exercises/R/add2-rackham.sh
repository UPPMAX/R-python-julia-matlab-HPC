#!/bin/bash
# A batch script to run a serial R code on Rackham
#SBATCH -A naiss2023-22-914 # Course project id. Change to your own project ID after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.0.4
module purge 
module load R/4.0.4

# Run your R script (here 'add2.R') for some random numbers, here 234 and 346 
Rscript --no-save --quiet add2.R 234 346
