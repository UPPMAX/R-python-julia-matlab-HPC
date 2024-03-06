#!/bin/bash
# A batch script for running the ML R program Rscript.R on Rackham
#SBATCH -A naiss2023-22-914
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 1
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
ml R_packages/4.0.4

R --no-save --no-restore -f Rscript.R
