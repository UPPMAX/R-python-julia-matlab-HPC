ML with R 
=========

.. questions::

   - Is R suitable for Machine Learning (ML)?
   - How to run R ML jobs on a HPC system (UPPMAX, HPC2N, ...)
   
.. objectives:: 

   - Short introduction to ML with R
   - Show the structure of a suitable batch script
   - Examples to try

R provides many packages that are specifically designed for machine learning. R is also known for its statistical capabilities for analysis and interpretation of data. 

This all makes it easier to develop and deploy models, also without having to write a lot of code yourself. 

The R community has contributed many powerful packages, both for machine learning and data science. Some of the popular packages are: 

- Dplyr
- Tidyr
- Caret
- MLR
- ggplot2
- randomForest
- mlbench

and many many more. 

Running your code
-----------------



R batch scripts for ML
~~~~~~~~~~~~~~~~~~~~~~

Since most R codes for Machine Learning would run for a fairly long time, you would usually have to run them in a batch script. 

**Workflow**

1. Determine if you need any R libraries that are not already installed 

Serial code
'''''''''''

.. type-along:: 

   Short serial batch example for running the code ``hello.R``

   .. tabs::

      .. tab:: UPPMAX

         Short serial example script for Rackham. Loading R/4.1.1

         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss2024-22-107 # Course project id. Change to your own project ID after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here R/4.1.1
            module load R/4.1.1
            
            # Run your R script (here 'hello.R')
            R --no-save --quiet < hello.R
  
            

      .. tab:: HPC2N

         Short serial example for running on Kebnekaise. Loading R/4.1.2 and prerequisites   
       
         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2n2024-025 # Change to your own project ID
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here R/4.1.2 and prerequisites 
            module load GCC/11.2.0  OpenMPI/4.1.1  R/4.1.2
            
            # Run your R script (here 'hello.R')
            R --no-save --quiet < hello.R
            
            
      .. tab:: hello.R
   
         R example code
   
         .. code-block:: R
        
            message <-"Hello World!"
            print(message)  

   Send the script to the batch:

   .. code-block:: console

      $ sbatch <batch script>

        
Parallel code 
'''''''''''''

foreach and doParallel
::::::::::::::::::::::

.. type-along:: 

   Short parallel example, using foreach and doParallel
   
   .. tabs::

      .. tab:: UPPMAX

         Short parallel example (Since we are using packages "foreach" and "doParallel", you need to use module R_packages/4.1.1 instead of R/4.1.1. 

         .. code-block:: sh
        
            #!/bin/bash
            #SBATCH -A naiss2024-22-107
            #SBATCH -t 00:10:00
            #SBATCH -N 1
            #SBATCH -c 4
            
            ml purge > /dev/null 2>&1
            ml R_packages/4.1.1
            
            # Batch script to submit the R program parallel_foreach.R 
            R -q --slave -f parallel_foreach.R


      .. tab:: HPC2N

         Short parallel example (using packages "foreach" and "doParallel" which are included in the R module) for running on Kebnekaise. Loading R/4.0.4 and its prerequisites. 
       
         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2n2024-025 # Change to your own project ID
            #SBATCH -t 00:10:00
            #SBATCH -N 1
            #SBATCH -c 4
            
            ml purge > /dev/null 2>&1
            ml GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4
            
            # Batch script to submit the R program parallel_foreach.R 
            R -q --slave -f parallel_foreach.R


      .. tab:: parallel_foreach.R
 
         This R script uses packages "foreach" and "doParallel". 
       
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

   Send the script to the batch:

   .. code-block:: console

      $ sbatch <batch script>

Rmpi
::::

.. type-along:: 

   Short parallel example using package “Rmpi” 

   .. tabs::

      .. tab:: UPPMAX

         Short parallel example (using package "Rmpi", so we need to load the module R_packages/4.1.1 instead of R/4.1.1 and we need to load a suitable openmpi module, openmpi/4.0.3)

         .. code-block:: sh
        
            #!/bin/bash
            #SBATCH -A naiss2024-22-107
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 8
            
            export OMPI_MCA_mpi_warn_on_fork=0
            export OMPI_MCA_btl_openib_allow_ib=1
            
            ml purge > /dev/null 2>&1
            ml R_packages/4.1.1
            ml openmpi/4.0.3
            
            mpirun -np 1 R CMD BATCH --no-save --no-restore Rmpi.R output.out 
           


      .. tab:: HPC2N

         Short parallel example (using packages "Rmpi"). Loading R/4.0.4 and its prerequisites. 
       
         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2n2024-025# Change to your own project ID
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 8
            
            export OMPI_MCA_mpi_warn_on_fork=0
            
            ml purge > /dev/null 2>&1
            ml GCC/10.2.0  OpenMPI/4.0.5
            ml R/4.1.1
            
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

      Send the script to the batch system: 

      .. code-block:: console

         $ sbatch <batch script>

ML code
''''''''

.. tabs::

   .. tab:: UPPMAX

        Short ML example for running on Rackham.         
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss2024-22-107
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH --exclusive
            #SBATCH -p node
            #SBATCH -N 1
            #SBATCH -M snowy
            #SBATCH --gpus=1
            #SBATCH --gpus-per-node=1
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error
            
            ml purge > /dev/null 2>&1
            ml R_packages/4.1.1
            
            R --no-save --no-restore -f Rscript.R
           

   .. tab:: HPC2N

        Short ML example for running on Kebnekaise.       
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2n2024-025 # Change to your own project ID
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 1
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error
            
            ml purge > /dev/null 2>&1
            ml GCC/10.2.0  OpenMPI/4.0.5
            ml R/4.0.4
            
            R --no-save --no-restore -f Rscript.R


   .. tab:: Rscript.R

        Short ML example.       
       
        .. code-block:: sh

            #Example taken from https://github.com/lgreski/datasciencectacontent/blob/master/markdown/pml-randomForestPerformance.md
            library(mlbench)
            data(Sonar)
            library(caret)
            set.seed(95014)
            
            # create training & testing data sets
            inTraining <- createDataPartition(Sonar$Class, p = .75, list=FALSE)
            training <- Sonar[inTraining,]
            testing <- Sonar[-inTraining,]
            
            # set up training run for x / y syntax because model format performs poorly
            x <- training[,-61]
            y <- training[,61]
            
            #Serial mode
            fitControl <- trainControl(method = "cv",
                                       number = 25,
                                       allowParallel = FALSE)
            
            stime <- system.time(fit <- train(x,y, method="rf",data=Sonar,trControl = fitControl))
            
            
            #Parallel mode
            library(parallel)
            library(doParallel)
            cluster <- makeCluster(1) 
            registerDoParallel(cluster)
            
            fitControl <- trainControl(method = "cv",
                                       number = 25,
                                       allowParallel = TRUE)

            ptime <- system.time(fit <- train(x,y, method="rf",data=Sonar,trControl = fitControl))
            
            stopCluster(cluster)
            registerDoSEQ()
            
            fit
            fit$resample
            confusionMatrix.train(fit)
            
            #Timings
            timing <- rbind(sequential = stime, parallel = ptime)
            timing

.. code-block:: console

   $ sbatch <batch script>


Exercises
---------

.. challenge:: Serial batch script for R

   Run the serial batch script from further up on the page, but for the add2.R code. Remember the arguments.
    
.. solution:: Solution for UPPMAX
    :class: dropdown
    
          Serial script on Rackham  
          
          .. code-block:: sh
 
             #!/bin/bash
             #SBATCH -A naiss2024-22-107 # Change to your own after the course
             #SBATCH --time=00:10:00 # Asking for 10 minutes
             #SBATCH -n 1 # Asking for 1 core
             
             # Load any modules you need, here for R/4.1.1
             module load R/4.1.1
             
             # Run your R script 
             Rscript add2.R 2 3 


.. solution:: Solution for HPC2N
    :class: dropdown
    
          Serial script on Kebnekaise 
          
          .. code-block:: sh
 
             #!/bin/bash
             #SBATCH -A hpc2n2024-025 # Change to your own project ID
             #SBATCH --time=00:10:00 # Asking for 10 minutes
             #SBATCH -n 1 # Asking for 1 core
             
             # Load any modules you need, here for R/4.0.4
             module load GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4
             
             # Run your R script 
             Rscript add2.R 2 3 




.. challenge:: Parallel job run

   Try running the parallel example with "foreach" from further up on the page. 


.. challenge:: R for ML

   Run the ML example shown in this session. 

