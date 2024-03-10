#!/bin/bash
#SBATCH -A hpc2n2024-025 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.1.2 and prerequisites + R-bundle-Bioconductor/3.14-R-4.1.2
module load GCC/11.2.0  OpenMPI/4.1.1  R/4.1.2 R-bundle-Bioconductor/3.14-R-4.1.2

# Run your R script (here 'iris_ml.R')
R --no-save --quiet < iris_ml.R
