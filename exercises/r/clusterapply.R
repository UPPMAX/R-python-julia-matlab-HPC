library(parallel)

# Define a function to be applied
square_function <- function(x) {
    return(sqrt(x))
}

# Create the sequence of values
numbers <- seq(1,1000000)

# Create a cluster with 4 workers
cl <- makeCluster(4)

# Use a parallel lapply function
result_parallel <- clusterApply(cl, numbers, square_function)

# Stop the cluster
stopCluster(cl)

# Print the result
print(unlist(result_parallel))
