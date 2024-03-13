#!/bin/bash
#SBATCH -A hpc2n2023-110     # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -n 1                 # nr. tasks
#SBATCH --time=00:20:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file

ml purge > /dev/null 2>&1
ml GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4
Rscript --no-save --no-restore script-df.R
