function results = parfeval_mean(ncols)
results = parfeval(@mean, 1, rand(ncols))
end
