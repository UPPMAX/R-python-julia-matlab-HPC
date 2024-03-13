library(doParallel)

# number of iterations = number of processes
n <- 6

sleep_serial <- function(n) {
  for (i in 1:n) {
      Sys.sleep(1)
  }
}

serial_time <- system.time(   sleep_serial(n)   )[3]
serial_time

sleep_parallel <- function(n) {
  r <- foreach(i=1:n) %dopar% Sys.sleep(1)
}

cl <- makeCluster(n)
registerDoParallel(cl)
parallel_time <- system.time(    sleep_parallel(n)   )[3]
stopCluster(cl)
parallel_time
