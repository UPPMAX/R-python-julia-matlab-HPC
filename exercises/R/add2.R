 args <- commandArgs(trailingOnly = TRUE)
 num1 <- as.numeric(args[1])
 num2 <- as.numeric(args[2])

 answer <- num1 + num2
 cat("Sum of arguments is: ", answer)
 cat("\n")
