#!/bin/bash
#SBATCH -A hpc2n2023-110     # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -n 1                 # nr. tasks
#SBATCH --time=00:20:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file

ml purge  > /dev/null 2>&1
ml Julia/1.8.5-linux-x86_64

julia --threads X script-df.jl  # X number of threads
