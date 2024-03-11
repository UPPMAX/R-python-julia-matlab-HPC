#SBATCH -A naiss2024-22-107   # your project_ID  
#SBATCH -M snowy
#SBATCH -p node
##SBATCH -C gpu   #NB: Only for Bianca
#SBATCH -N 1
#SBATCH --job-name=juliaGPU         # create a short name for your job
#SBATCH --gpus-per-node=1             # number of gpus per node (Bianca 2, Snowy 1)
#SBATCH --time=00:15:00          # total run time limit (HH:MM:SS)
#SBATCH --qos=short              # if test run t<15 min

ml julia/1.8.5-linux-x86_64

julia script-gpu.jl

#Output:

#Downloading artifact: CUDNN
#Downloading artifact: CUTENSOR
#CUDA toolkit 11.7, artifact installation
#NVIDIA driver 525.85.12, for CUDA 12.0
#CUDA driver 12.0

#Libraries:
#- CUBLAS: 11.10.1
#- CURAND: 10.2.10
#- CUFFT: 10.7.2
#- CUSOLVER: 11.3.5
#- CUSPARSE: 11.7.3
#- CUPTI: 17.0.0
#- NVML: 12.0.0+525.85.12
#- CUDNN: 8.30.2 (for CUDA 11.5.0)
#- CUTENSOR: 1.4.0 (for CUDA 11.5.0)

#Toolchain:
#- Julia: 1.8.5
#- LLVM: 13.0.1
#- PTX ISA support: 3.2, 4.0, 4.1, 4.2, 4.3, 5.0, 6.0, 6.1, 6.3, 6.4, 6.5, 7.0, 7.1, 7.2
#- Device capability support: sm_35, sm_37, sm_50, sm_52, sm_53, sm_60, sm_61, sm_62, sm_70, sm_72, sm_75, sm_80, sm_86

#1 device:
#  0: Tesla T4 (sm_75, 14.605 GiB / 15.000 GiB available)
#  0.988437 seconds (2.72 M allocations: 132.556 MiB, 4.72% gc time, 99.10% compilation time)
#  5.707402 seconds (1.30 M allocations: 65.564 MiB, 0.72% gc time, 19.70% compilation time)
#  0.000813 seconds (2 allocations: 512.047 KiB)
#  0.000176 seconds (16 allocations: 384 bytes)
