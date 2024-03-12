#!/bin/bash -l
#SBATCH -A naiss2024-22-107     # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -n 4                 # nr. tasks/coresw
#SBATCH --time=00:20:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file

ml julia/1.8.5

julia --threads 4 script-df.jl  # X number of threads
