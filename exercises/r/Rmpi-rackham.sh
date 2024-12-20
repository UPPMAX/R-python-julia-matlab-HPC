#!/bin/bash
#SBATCH -A naiss2024-22-1202
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 8

export OMPI_MCA_mpi_warn_on_fork=0

ml purge > /dev/null 2>&1
ml R/4.1.1 R_packages/4.1.1
ml openmpi/3.1.5

mpirun -np 1 R CMD BATCH --no-save --no-restore Rmpi.R output.out
