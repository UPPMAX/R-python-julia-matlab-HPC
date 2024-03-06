# This program will add two numbers that are provided by the user
args = commandArgs(trailingOnly = TRUE)
res = as.numeric(args[1]) + as.numeric(args[2])
print(paste("The sum of the two numbers is", res))
