using BenchmarkTools
using .Threads

n = 6   # number of iterations

function sleep_serial(n)   #Serial version
    for i in 1:n
        sleep(1)
    end
end

@btime sleep_serial(n) evals=1 samples=1

function sleep_threaded(n) #Parallel version
    @threads for i = 1:n
        sleep(1)
    end
end

@btime sleep_threaded(n) evals=1 samples=1
