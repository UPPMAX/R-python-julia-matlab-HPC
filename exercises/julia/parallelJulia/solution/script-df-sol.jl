using DataFrames
using Base.Threads

# Create a data frame with two sets of values ID and Value
data_df = DataFrame(ID = 1:10000, Value = range(3, step=2, length=10000))

# Define a function to compute the sum in parallel
function parallel_sum(data)
    # Initialize an array to store thread-local sums
    local_sums = zeros(eltype(data), nthreads())
    # Iterate through each value in the 'Value' column in parallel
    @threads for i =1:length(data)
        # Add the value to the thread-local sum
        local_sums[threadid()] += data[i]
    end
    # Combine the local sums to obtain the total sum
    total_sum_parallel = sum(local_sums)
    return total_sum_parallel
end

# Compute the sum in parallel
total_sum_parallel = parallel_sum(data_df.Value)

# Compute the mean
mean_value_parallel = total_sum_parallel / length(data_df.Value)

# Print the mean value
println(mean_value_parallel)
