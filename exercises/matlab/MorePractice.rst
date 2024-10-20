Extra MATLAB Exercises
----------------------

.. challenge:: Run the following function serially, then parallelize the loop and rerun it with ``parpool`` using 6 workers. Compare the runtimes and output orders.

  .. code-block:: matlab
  
    function t_out = greetings()
      % Planets (incl. dwarf) in ascending order of distance from Sun
      planets = ["Mercury" "Venus" "Earth" "Mars" "Ceres" ...
          "Jupiter" "Saturn" "Uranus" "Neptune" "Pluto" ...
          "Orcus" "Salacia" "Haumea" "Quaoar" "Makemake" ...
          "Gonggong" "Eris" "Sedna"];
      tic
      % parallelize the following
      for idx=1:length(planets)
        disp("Hello from "+planets(idx))
      end
      t_out = toc;
    end

.. challenge:: Run the following code as a batch job with ``iter=10000`` and set the number of workers equal to 8. Start with `the SBATCH template here <https://uppmax.github.io/R-python-julia-matlab-HPC/matlab/slurmMatlab.html#parallel-batch-script>`.

   .. code-block:: matlab
    
      function [dstats, t] = dice_stats_par(iter)
      % All numbers N for which there exist fair "dice" with N faces 
      nsides = [2:22 24:2:32 36 38 48 50 60 62 92 100 120];
      % pre-allocate array for stats
      dstats = zeros(numel(nsides),4);
      
      tic
      parfor nf = 1:numel(nsides)
          rolls = randi([1,nsides(nf)], [iter, 1], 'uint32');
          mmm = [nsides(nf) mean(double(rolls)) median(rolls) mode(rolls)];
          dstats(nf,:) = mmm;
          % parfor loop requires us to set whole row at once
          % Trying to set a slice of the row results in this Error:
          %   The parfor-loop variable 'dstats' is indexed using the loop variable,
          %   but it is not a valid sliced output variable.
      end
      
      % make dstats results readable
      dstats = array2table(dstats, 'VariableNames',{'D','Mean','Median','Mode'});
      writetable(dstats,'dice_stats_out.txt','Delimiter','\t')
      t=toc;
      disp(t)
      end

    You can play with the number of workers to see how the running time changes, and try submitting from the MATLAB command line or regular terminal.

.. solution::

  The following is an example batch script where you will need to modify the #SBATCH parameters and the name of the MATLAB module to fit your resources.

  .. code-block:: matlab
    #!/bin/bash
    # Change to your actual project number
    #SBATCH -A XXXX-YY-ZZZ
    #SBATCH --ntasks-per-node=<how many tasks>
    #SBATCH --nodes <how many nodes>
    
    # Asking for 30 min (change as you want)
    #SBATCH -t 00:30:00
    #SBATCH --error=matlab_%J.err
    #SBATCH --output=matlab_%J.out
    
    # Clean the environment
    module purge > /dev/null 2>&1
    
    # Change depending on resource and MATLAB version
    # to find out available versions: module spider matlab
    module add MATLAB/<version>
    
    # Executing a parallel matlab program
    srun matlab -nojvm -nodisplay -nodesktop -nosplash -r "par_dice_stats(10000)"

    The .out file will be ugly, and the time may be hard to find in it. A clean version of the output table will be saved as ``dice_stats_out.txt``



