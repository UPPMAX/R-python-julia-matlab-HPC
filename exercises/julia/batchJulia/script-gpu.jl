using CUDA 

CUDA.versioninfo()

N = 2^8
x = rand(N, N)
y = rand(N, N)

A = CuArray(x)
B = CuArray(y)

# Calculation on CPU
@time x*y
# Calculation on GPU
@time A*B

# Calculation on CPU
@time x*y
# Calculation on GPU
@time A*B
