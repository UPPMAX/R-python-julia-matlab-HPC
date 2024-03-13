library(doParallel)
library(foreach)

# Create a data frame with two sets called ID and Value
data_df <- data.frame(
ID <- seq(1,10000), Value <- seq(from=3,by=2,length.out=10000)
)

# Create 4 subsets
num_subsets <- 4

# Create a cluster with 4 workers
cl <- makeCluster(4)

# Register the cluster for parallel processing
registerDoParallel(cl)

# Function to process a subset of the whole data
process_subset <- function(subset) {
# Perform some computation on the subset
subset_sum <- sum(subset$Value)
return(data.frame(SubsetSum = subset_sum))
}

# Use foreach with dopar to process subsets in parallel
result <- foreach(i = 1:num_subsets, .combine = rbind) %dopar% {
# Determine the indices for the subset
subset_indices <- seq(from = 1 + (i - 1) * nrow(data_df) / num_subsets,
                        to = i * nrow(data_df) / num_subsets)

# Create the subset
subset_data <- data_df[subset_indices, , drop = FALSE]

# Process the subset
subset_result <- process_subset(subset_data)

return(subset_result)
}

# Stop the cluster when done
stopCluster(cl)

# Print the results
print(sum(result)/10000)
