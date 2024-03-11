#!/bin/bash
#SBATCH -A hpc2n2024-025 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.1.2 and prerequisites + R-bundle-Bioconductor/3.14-R-4.1.2
module load GCC/11.2.0  OpenMPI/4.1.1  R/4.1.2 R-bundle-Bioconductor/3.14-R-4.1.2

Make sure we use the renv with datarium installed
cd /proj/nobackup/naiss2024-025/<path-to-renv>

# Run your R script (here 'validation.R'. Give the path if it is not located in the same directory as the renv)
R --no-save --quiet < <path-to-file>/validation.R
