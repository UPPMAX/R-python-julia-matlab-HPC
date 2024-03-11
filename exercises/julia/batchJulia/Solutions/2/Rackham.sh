#!/bin/bash -l
#SBATCH -A naiss2024-22-107   # your project_ID
#SBATCH -M snowy
#SBATCH -p node
#SBATCH --gres=gpu:1
#SBATCH -N 1
#SBATCH --job-name=juliaGPU         # create a short name for your job
#SBATCH --time=00:15:00          # total run time limit (HH:MM:SS)
#SBATCH --qos=short              # if test run t<15 min

ml julia/1.8.5

julia script-gpu.jl
