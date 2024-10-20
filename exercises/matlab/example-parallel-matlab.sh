#!/bin/bash
# Change to your actual project number
#SBATCH -A XXXX-YY-ZZZ
#SBATCH --ntasks-per-node=<how many tasks>
#SBATCH --nodes <how many nodes>

# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module add MATLAB/<version>

# Executing a parallel matlab program - change to an actial program 
srun matlab -nojvm -nodisplay -r parallel-matlab-script.m
