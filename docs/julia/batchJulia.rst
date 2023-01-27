Running Julia in batch mode
============================

.. questions::

   - What is a batch job?
   - How to make a batch job?

   
   
.. objectives:: 

   - Short introduction to SLURM scheduler
   - Show structure of a batch script
   - Try example


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

  - Inside the batch script you need to load the modules you need, for instance Julia
  - Possibly activate an isolated/virtual environment to access own-installed packages
  - Ask for resources depending on if it is a parallel job or a serial job, if you need GPUs or not, etc.
  - Give the command(s) to your Julia script

- Submit batch script with ``sbatch <my-julia-script.sh>`` 

Common file extensions for batch scripts are ``.sh`` or ``.batch``, but they are not necessary. You can choose any name that makes sense to you. 

Useful commands to the batch system
-----------------------------------

- Submit job: ``sbatch <jobscript.sh>``
- Get list of your jobs: ``squeue -u <username>``
- Check on a specific job: ``scontrol show job <job-id>``
- Delete a specific job: ``scancel <job-id>``
- Useful info about a job: ``sacct -l -j <job-id> | less -S``
- Url to a page with info about the job (Kebnekaise only): ``job-usage <job-id>``
         
Examples of batch scripts for Julia
-----------------------------------

Serial code
'''''''''''
            
.. tabs::

   .. tab:: UPPMAX

        Short serial example script for Rackham. Loading Python 3.9.5. Numpy is preinstalled and does not need to be loaded. 

        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A SNIC2022-22-641 # Change to your own after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here Python 3.9.5. 
            module load python/3.9.5 
            
            # Run your Python script 
            python mmmult.py   
            

   .. tab:: HPC2N

        Short serial example for running on Kebnekaise with Julia v. 1.8.5
       
        .. code-block:: sh
   
            #!/bin/bash            
            #SBATCH -A hpc2n20xx-xyz     # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks  
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file                                                                                                                                                                         


            ml purge  > /dev/null 2>&1   # recommended purge
            ml Julia/1.8.5-linux-x86_64  # Julia module
                       
            julia serial.jl              # run the serial script
            
            
   .. tab:: serial.jl 
   
        Julia example code.
   
        .. code-block:: julia
        
            y = "Hello World"
            println(y)

        
Serial code + self-installed package in virt. env. 
''''''''''''''''''''''''''''''''''''''''''''''''''

.. tabs::

   .. tab:: UPPMAX

        Short serial example for running on Rackham. Loading Python/3.9.5 + using any Python packages you have installed yourself with venv. More information will follow under the separate session for UPPMAX. 

        .. code-block:: sh
        
            #!/bin/bash
            #SBATCH -A SNIC2022-22-641 # Change to your own after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.9.5 
            module load python/3.9.5
            
            # Activate your virtual environment. 
            # CHANGE <path-to-virt-env> to the full path where you installed your virtual environment
            # Example: /proj/snic2022-22-641/nobackup/mrspock/pythonUPPMAX 
            source <path-to-virt-env>/bin/activate
            
            # Run your Python script
            python <my_program.py>


   .. tab:: HPC2N

        Short serial example for running on Kebnekaise. Loading Julia v. 1.8.5 and using any Julia packages you have installed
        yourself with virtual environment. During the separate session for HPC2N there will more about how to install 
        something yourself this way. 
       
        .. code-block:: sh

            #!/bin/bash            
            #SBATCH -A hpc2n20xx-xyz     # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks  
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file                                                                                                                                                                         


            ml purge  > /dev/null 2>&1   # recommended purge
            ml Julia/1.8.5-linux-x86_64  # Julia module
                       
            # Move to the directory where the ".toml" files 
            # for the environment are located
            julia --project=. serial-env.jl  # run the script 

        If this works, you will see the installed packages in the output file. In the present case
        because I installed the ``DFTK`` package only in ``my-third-env`` environment, I can 
        see the following output:

        .. code-block:: sh

            Status `/pfs/proj/nobackup/path/Julia-Test/my-third-env/Project.toml`
            [acf6eb54] DFTK v0.6.2

   .. tab:: serial-env.jl 
   
        Julia example code where an environment is used.
   
        .. code-block:: julia
        
            using Pkg
            Pkg.status()


Parallel code
'''''''''''''

.. tabs::

   .. tab:: UPPMAX

        Short serial example script for Rackham. Loading Python 3.9.5. Numpy is preinstalled and does not need to be loaded. 

        .. code-block:: sh

            #!/bin/bash  
            

   .. tab:: HPC2N

        Short serial example for running on Kebnekaise with Julia v. 1.8.5
       
        .. code-block:: sh
   
            #!/bin/bash            

        .. tabs:: 

           .. tab:: Serial 
              
                serial case 

           .. tab:: Threaded

                threaded 

           .. tab:: Distributed

                Distributed

           .. tab:: MPI 

                distributed 

        The corresponding batch scripts for these examples are given here:

        .. tabs:: 

           .. tab:: job-serial.sh  

                #! ou  

           .. tab:: job-threaded.sh 

                script 

           .. tab:: job-distributed.sh 

                script 

           .. tab:: job-mpi.sh 

                script 





GPU code
''''''''

In order to use the NVIDIA GPUs with Julia, you will need to load a CUDA toolkit module on the
cluster and install the ``CUDA`` package in Julia as in the next sequence of commands:


.. tabs::

   .. tab:: UPPMAX

        Short GPU example for running on Snowy.         
       
        .. code-block:: sh

            FIX for UPPMAX ...
            

   .. tab:: HPC2N

        .. code-block:: sh

            $ ml Julia/1.8.5-linux-x86_64   # Julia version
            $ ml CUDA/11.4.1                # CUDA toolkit module
            $ julia
            (v1.8) pkg> add CUDA 
                Updating registry at `~/.julia/registries/General.toml`
                Resolving package versions...
                Installed CEnum ───────── v0.4.2
                ...
     

Once this initial setting is completed, you will be able to use the GPUs available on the
cluster. Here, there is a simple example for computing a matrix-matrix multplication. As a 
reference point, we show the simulation on CPUs as well. 

.. tabs::

   .. tab:: UPPMAX

        Short GPU example for running on Snowy.         
       
        .. code-block:: sh

            FIX for UPPMAX ...
            

   .. tab:: HPC2N

        .. code-block:: sh

            #!/bin/bash            
            #SBATCH -A hpc2n20xx-xyz     # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks  
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file  
            #SBATCH --gres=gpu:k80:1     # 1 GPU K80 card

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64
            ml CUDA/11.4.1

            export JULIA_CUDA_USE_BINARYBUILDER=false

            julia script-gpu.jl

        Setting the environment variable ``JULIA_CUDA_USE_BINARYBUILDER`` to ``false`` is a best practice,
        otherwise Julia would try to download binaries for CUDA compatible libraries.

   .. tab:: script-gpu.jl 
   
        Julia GPU example code.
   
        .. code-block:: julia
         
            using CUDA 

            CUDA.versioninfo()

            N = 2^8
            x = rand(N, N)
            y = rand(N, N)

            A = CuArray(x)
            B = CuArray(y)

            # Calculation on CPU
            @time x*y
            # Calculation on GPU
            @time A*B

            # Calculation on CPU
            @time x*y
            # Calculation on GPU
            @time A*B
                 



Exercises
---------

.. challenge:: Run a serial script
    
    Run the serial script ``serial-sum.jl``: 

            .. code-block:: julia

                x = parse( Int32, ARGS[1] )
                y = parse( Int32, ARGS[2] )
                summ = x + y
                println("The sum of the two numbers is ", summ)

    This scripts accepts two integers as command line arguments.

    .. solution:: Solution for HPC2N
        :class: dropdown
        
            This batch script is for Kebnekaise. 
            
            .. code-block:: sh
    
                #!/bin/bash            
                #SBATCH -A hpc2n20xx-xyz     # your project_ID       
                #SBATCH -J job-serial        # name of the job         
                #SBATCH -n 1                 # nr. tasks  
                #SBATCH --time=00:03:00      # requested time
                #SBATCH --error=job.%J.err   # error file
                #SBATCH --output=job.%J.out  # output file                                                                                                                                                                         

                ml purge  > /dev/null 2>&1   # recommended purge
                ml Julia/1.8.5-linux-x86_64  # Julia module
                        
                julia serial-sum.jl Arg1 Arg2    # run the serial script

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



.. challenge:: Run the GPU script
    
    Run the script ``script-gpu.jl`` that is given above. Why are we running the simulations
    twice?

    .. solution:: Solution for HPC2N
        :class: dropdown
        
            This batch script is for Kebnekaise. We run the simulation twice because
            in this way, the reported time is more reliable for the computing time as
            in the first simulation, data transfer and other settings could be added to
            the reported time.
            
            .. code-block:: sh
                
                #!/bin/bash            
                #SBATCH -A hpc2n20xx-xyz     # your project_ID       
                #SBATCH -J job-serial        # name of the job         
                #SBATCH -n 1                 # nr. tasks  
                #SBATCH --time=00:03:00      # requested time
                #SBATCH --error=job.%J.err   # error file
                #SBATCH --output=job.%J.out  # output file  
                #SBATCH --gres=gpu:k80:1     # 1 GPU K80 card

                ml purge  > /dev/null 2>&1
                ml Julia/1.8.5-linux-x86_64
                ml CUDA/11.4.1

                export JULIA_CUDA_USE_BINARYBUILDER=false

                julia script-gpu.jl

            Output:
                0.689096 seconds (2.72 M allocations: 132.617 MiB, 6.27% gc time, 99.62% compilation time)

                1.194153 seconds (1.24 M allocations: 62.487 MiB, 3.41% gc time, 55.13% compilation time)

                0.000933 seconds (2 allocations: 512.047 KiB)

                0.000311 seconds (5 allocations: 192 bytes)

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
   - Batch jobs runs without interaction with user
   - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing 
     the actual work within the job, for instance one or several Julia scripts.

    
