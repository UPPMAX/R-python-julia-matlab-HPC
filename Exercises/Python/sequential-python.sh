#!/bin/bash
# This is a batch script for running several programs or variations of programs sequentially, on Kebnekaise
#SBATCH -A hpc2n2023-110 # Remember to change this to your own project ID
# We are asking for 5 minutes
#SBATCH --time=00:05:00
# Asking for one GPU
#SBATCH --gres=gpu:v100:1

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/10.3.0  OpenMPI/4.1.1 TensorFlow/2.6.0-CUDA-11.3.1

# Output to file - not needed if your job creates output in a file directly
# In this example I also copy the output somewhere else and then run another executable (or you could just run the same executable for different parameters).

python <my_tf_program.py> <param1> <param2> > myoutput1 2>&1
cp myoutput1 mydatadir
python <my_tf_program.py> <param3> <param4> > myoutput2 2>&1
cp myoutput2 mydatadir
python <my_tf_program.py> <param5> <param6> > myoutput3 2>&1
cp myoutput3 mydatadir
