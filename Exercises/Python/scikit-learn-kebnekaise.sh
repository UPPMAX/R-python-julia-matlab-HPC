#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A hpc2n2023-110
# We are asking for 5 minutes
#SBATCH --time=00:05:00
# Asking for one GPU
#SBATCH --gres=gpu:v100:1

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/10.3.0  OpenMPI/4.1.1 TensorFlow/2.6.0-CUDA-11.3.1

# Activate the virtual environment we installed to
#source <path-to-install-dir>/vpyenv/bin/activate

# Run your Python script
python scikit-learn-kebnekaise.sh
