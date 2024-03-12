#!/bin/bash -l
#SBATCH -A naiss2024-22-107        # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -M snowy
#SBATCH -p node
#SBATCH --gres=gpu:1
#SBATCH -N 1
#SBATCH --time=00:15:00      # requested time
#SBATCH --qos=short
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file

ml julia/1.8.5

julia --project=. vgg_cifar10.jl
