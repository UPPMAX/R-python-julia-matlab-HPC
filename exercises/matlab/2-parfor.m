function t_out = par_greeting(n_planets)
planets = ["Mercury" "Venus" "Earth" "Mars" "Ceres" ...
    "Jupiter" "Saturn" "Uranus" "Neptune" "Pluto" ...
    "Orcus" "Salacia" "Haumea" "Quaoar" "Makemake" ...
    "Gonggong" "Eris" "Sedna"];
if n_planets < 1 || n_planets > length(planets)
    error("Please choose a number from 1 to 18.")
tic
% add (parallel) for-loop that prints "Hello from"+planets(idx) below:



t_out = toc;
end


