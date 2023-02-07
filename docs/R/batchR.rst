Running R in batch mode
=======================

.. questions::

   - What is a batch job?
   - How to write a batch script and submit a batch job?

   
   
.. objectives:: 

   - Short introduction to SLURM scheduler
   - Show structure of a batch script
   - Example to try


Any longer, resource-intensive, or parallel jobs must be run through a **batch script**.

The batch system used at both UPPMAX and HPC2N is called SLURM. 

SLURM is an Open Source job scheduler, which provides three key functions

- Keeps track of available system resources
- Enforces local system resource usage and job scheduling policies
- Manages a job queue, distributing work across resources according to policies

In order to run a batch job, you need to create and submit a SLURM submit file (also called a batch submit file, a batch script, or a job script).

Guides and documentation at: http://www.hpc2n.umu.se/support and https://www.uppmax.uu.se/support/user-guides/slurm-user-guide/ 

**Workflow**

- Write a batch script

  - Inside the batch script you need to load the modules you need (R and any prerequisites) 
  - If you are using any own-installed packages, make sure R_LIBS_USER is set (export R_LIBS_USER=/path/to/my/R-packages) 
  - Ask for resources depending on if it is a parallel job or a serial job, if you need GPUs or not, etc.
  - Give the command(s) to your R script

- Submit batch script with ``sbatch <my-batch-script-for-R.sh>`` 

Common file extensions for batch scripts are ``.sh`` or ``.batch``, but they are not necessary. You can choose any name that makes sense to you. 

Useful commands to the batch system
-----------------------------------

- Submit job: ``sbatch <jobscript.sh>``
- Get list of your jobs: ``squeue -u <username>``
- Check on a specific job: ``scontrol show job <job-id>``
- Delete a specific job: ``scancel <job-id>``
- Useful info about a job: ``sacct -l -j <job-id> | less -S``
- Url to a page with info about the job (Kebnekaise only): ``job-usage <job-id>``
         
Example R batch scripts
---------------------------- 

Serial code
'''''''''''
            
.. tabs::

   .. tab:: UPPMAX

        Short serial example script for Rackham. Loading R/4.0.4 

        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss2023-22-44 # Course project id. Change to your own project ID after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here R/4.0.4
            module load R/4.0.4
            
            # Run your R script (here 'hello.R')
            R --no-save --quiet < hello.R
  
            

   .. tab:: HPC2N

        Short serial example for running on Kebnekaise. Loading R/4.0.4 and prerequisites   
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here R/4.0.4 and prerequisites 
            module load GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4
            
            # Run your R script (here 'hello.R')
            R --no-save --quiet < hello.R
            
            
   .. tab:: hello.R
   
        R example code
   
        .. code-block:: R
        
            message <-"Hello World!"
            print(message)  


        
Parallel code 
'''''''''''''

.. tabs::

   .. tab:: UPPMAX

        Short parallel example (using packages "foreach" and "doParallel" which you may have to install first) for running on Rackham. Loading R/4.0.4. 

        .. code-block:: sh
        
            #!/bin/bash
            #SBATCH -A naiss2023-22-44
            #SBATCH -t 00:10:00
            #SBATCH -N 1
            #SBATCH -c 4
            
            ml purge > /dev/null 2>&1
            ml R/4.0.4
            
            # Batch script to submit the R program parallel_foreach.R 
            R -q --slave -f parallel_foreach.R


   .. tab:: HPC2N

        Short parallel example (using packages "foreach" and "doParallel") for running on Kebnekaise. Loading R/4.0.4 and its prerequisites. 
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
            #SBATCH -t 00:10:00
            #SBATCH -N 1
            #SBATCH -c 4
            
            ml purge > /dev/null 2>&1
            ml GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4
            
            # Batch script to submit the R program parallel_foreach.R 
            R -q --slave -f parallel_foreach.R


   .. tab:: parallel_foreach.R

        This R script uses packages "foreach" and "doParallel" which you may or may not have to install yourself first. 
       
        .. code-block:: R

            library(parallel)
            library(foreach)
            library(doParallel)
            # Function for calculating PI with no values
            calcpi <- function(no) {
              y <- runif(no)
              x <- runif(no)
              z <- sqrt(x^2+y^2)
              length(which(z<=1))*4/length(z)
            }
            # Detect the number of cores
            no_cores <- detectCores() - 1
            # Loop to max number of cores
            for (n in 1:no_cores) {
              # print how many cores we are using
              print(n)
              # Set start time
              start_time <- Sys.time()
              # Create a cluster
              nproc <- makeCluster(n)
              registerDoParallel(nproc)
              # Create a vector 1000 length with 100 randomizations
              input <- rep(100, 1000)
              # Use foreach on n cores
              registerDoParallel(nproc)
              res <- foreach(i = input, .combine = '+') %dopar%
                calcpi(i)
              # Print the mean of the results
              print(res/length(input))
              # Stop the cluster
              stopCluster(nproc)
              # print end time
              print(Sys.time() - start_time)
              }


.. tabs::

   .. tab:: UPPMAX

        Short parallel example (using packages "Rmpi"). Loading R/4.0.4. 

        .. code-block:: sh
        
            #!/bin/bash
            #SBATCH -A naiss2023-22-44
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 28
            
            export OMPI_MCA_mpi_warn_on_fork=0
            
            ml purge > /dev/null 2>&1
            ml R/4.0.4
            
            mpirun -np 1 R CMD BATCH --no-save --no-restore Rmpi.R output.out 
           


   .. tab:: HPC2N

        Short parallel example (using packages "Rmpi"). Loading R/4.0.4 and its prerequisites. 
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 28
            
            export OMPI_MCA_mpi_warn_on_fork=0
            
            ml purge > /dev/null 2>&1
            ml GCC/10.2.0  OpenMPI/4.0.5
            ml R/4.0.4
            
            mpirun -np 1 R CMD BATCH --no-save --no-restore Rmpi.R output.out 
   

   .. tab:: Rmpi.R

        This R script uses package "Rmpi". 
       
        .. code-block:: sh
        
           # Load the R MPI package if it is not already loaded.
           if (!is.loaded("mpi_initialize")) {
           library("Rmpi")
           }
           print(mpi.universe.size())
           ns <- mpi.universe.size() - 1
           mpi.spawn.Rslaves(nslaves=ns)
           #
           # In case R exits unexpectedly, have it automatically clean up
           # resources taken up by Rmpi (slaves, memory, etc...)
           .Last <- function(){
           if (is.loaded("mpi_initialize")){
           if (mpi.comm.size(1) > 0){
           print("Please use mpi.close.Rslaves() to close slaves.")
           mpi.close.Rslaves()
           }
           print("Please use mpi.quit() to quit R")
           .Call("mpi_finalize")
           }
           }
           # Tell all slaves to return a message identifying themselves
           mpi.remote.exec(paste("I am",mpi.comm.rank(),"of",mpi.comm.size(),system("hostname",intern=T)))
           
           # Test computations
           x <- 5
           x <- mpi.remote.exec(rnorm, x)
           length(x)
           x
           
           # Tell all slaves to close down, and exit the program
           mpi.close.Rslaves()
           
           mpi.quit()



GPU code
''''''''

.. tabs::

   .. tab:: UPPMAX

        Short GPU example for running on Snowy.         
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A SNICXXXX-YY-ZZZ
            #SBATCH -t 00:10:00
            #SBATCH --exclusive
            #SBATCH -p node
            #SBATCH -N 1
            #SBATCH -M snowy
            #SBATCH --gpus=1
            #SBATCH --gpus-per-node=1
            
            # Load any modules you need, here loading Python 3.9.5 
            module load python/3.9.5
            
            # Run your code
            python <my-gpu-code>.py 
            

   .. tab:: HPC2N

        Short serial example for running on Kebnekaise. Loading SciPy-bundle/2021.05, Python/3.9.5 + Python package you have installed yourself with virtual environment. The full example can be found under "Using Python for Machine Learning jobs".       
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A SNIC2022-22-641 # Change to your own after the course
            #SBATCH --reservation=hpc-python  # Only valid during the course 
            #SBATCH --time=00:10:00  # Asking for 10 minutes
            # Asking for one K80 card
            #SBATCH --gres=gpu:k80:1
            
            # Remove any loaded modules and load the ones we need
            module purge  > /dev/null 2>&1
            module load GCC/10.3.0  OpenMPI/4.1.1 TensorFlow/2.6.0-CUDA-11.3.1
            
            # Activate the virtual environment we installed to
            # CHANGE <path-to-virt-env> to the full path where you installed your virtual environment
            # Example: /proj/snic2022-22-641/nobackup/mrspock/pythonUPPMAX
            source <path-to-virt-env>/bin/activate
            
            # Run your Python script
            python example-tf.py
           

The recommended TensorFlow version for this course is 2.6.0 on Kebnekaise. The module is compatible with Python 3.9.5 (automatically loaded when you load TensorFlow and its other prerequisites).            

Exercises
---------

.. challenge:: Run the first serial example script from further up on the page for this short Python code (sum-2args.py)
    
    .. code-block:: python
    
        import sys
            
        x = int(sys.argv[1])
        y = int(sys.argv[2])
            
        sum = x + y
            
        print("The sum of the two numbers is: {0}".format(sum))
        
    Remember to give the two arguments to the program in the batch script.

.. solution:: Solution for HPC2N
    :class: dropdown
    
          This batch script is for Kebnekaise. Adding the numbers 2 and 3. 
          
          .. code-block:: sh
 
            #!/bin/bash
            #SBATCH -A SNIC2022-22-641 # Change to your own after the course
            #SBATCH --time=00:05:00 # Asking for 5 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.9.5
            module load GCC/10.3.0  Python/3.9.5
            
            # Run your Python script 
            python sum-2args.py 2 3 

.. solution:: Solution for UPPMAX
    :class: dropdown
    
          This batch script is for UPPMAX. Adding the numbers 2 and 3. 
          
          .. code-block:: sh
 
            #!/bin/bash
            #SBATCH -A SNIC2022-22-641 # Change to your own after the course
            #SBATCH --time=00:05:00 # Asking for 5 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.9.5
            module load Python/3.9.5
            
            # Run your Python script 
            python sum-2args.py 2 3 

.. keypoints::

   - The SLURM scheduler handles allocations to the calculation nodes
   - Interactive sessions was presented in last slide
   - Batch jobs runs without interaction with user
   - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing the actual work within the job, for instance one or several Python scripts.
      - Remember to include possible input arguments to the Python script in the batch script.
    
