#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A naiss2024-22-107
# We are asking for 5 minutes
#SBATCH --time=00:05:00
# Asking for one GPU
#SBATCH -M snowy            
#SBATCH --gres=gpu:1   

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load python/3.9.5  

# Load virtual environment - change <path-to-virt-env> and <virt-env> to the actual path and name you used for your venv. A good one to use is the Example-gpu virtual environment you created under the "Isolated environments" session
source <path-to-virt-env>/<virt-env>/bin/activate   
	  
# Run your Python script
python add-list.py
