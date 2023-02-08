Interactive work on the compute nodes
=====================================

.. note::

   - It is possible to run Julia directly on the login (including ThinLinc) nodes.
   - But this should *only* be done for shorter jobs or jobs that do not use a lot of resources, as the login nodes can otherwise become slow for all users. 
   - If you want to work interactively with your code or data, you should start an interactive session.
   - If you rather will run a script which won't use any interactive user input while running, you can instead start a batch job, see next session.
   
.. questions::

   - How to reach the calculation nodes
   - How do I proceed to work interactively?
   
.. objectives:: 

   - Show how to reach the calculation nodes on UPPMAX and HPC2N
   - Test some commands on the calculation nodes

There are several ways to run Julia interactively

- Directly on the login nodes: **only** do this for short jobs that do not take a lot of resources
- As an interactive job on the computer nodes, launched via the batch system
- Jupyter notebooks (UPPMAX)

General
-------

In order to run interactively, you need to have compute nodes allocated to run on, and this is done through the batch system.  

Because you will have to wait until the nodes are allocated, and because you cannot know when this happens, this is not usually a recommended way to run Julia, but it is possible. 

.. warning::

    (HPC2N) Do note that it is not *real* interactivity as you probably mean it, as you will have to run it as a Julia script instead of by starting Julia and giving commands inside it. 
    - The reason for this is that you are not actually logged into the compute node and only sees the output of the commands you run. 

    Another option would be to use Jupyter notebooks. 
    This is somewhat convoluted to get to work correctly at HPC2N, but possible. Please contact us at support@hpc2n.umu.se if you want to go this route at HPC2N. 


Julia "interactively" on the compute nodes 
-------------------------------------------

To run interactively, you need to allocate resources on the cluster first. 
You can use the command salloc to allow interactive use of resources allocated to your job. 
When the resources are allocated, you need to preface commands with ``srun`` in order to 
run on the allocated nodes instead of the login node. 
      
- First, you make a request for resources with ``interactive``/``salloc``, like this:

.. tabs::

   .. tab:: UPPMAX (interactive)

      .. code-block:: sh
          
         $ interactive -n <tasks> --time=HHH:MM:SS -A naiss2023-22-44 
      
   .. tab:: HPC2N (salloc)

      .. code-block:: sh
          
         $ salloc -n <tasks> --time=HHH:MM:SS -A hpc2nXXXX-YYY 
         
      
where <tasks> is the number of tasks (or cores, for default 1 task per core), time is given in 
      hours, minutes, and seconds (maximum T168 hours), and then you give the id for your project 
      (**Snaiss2023-22-44** for this course)

Your request enters the job queue just like any other job, and interactive/salloc will tell you that it is
      waiting for the requested resources. When salloc tells you that your job has been allocated 
      resources, you can interactively run programs on those resources with ``srun``. The commands 
      you run with ``srun`` will then be executed on the resources your job has been allocated. 
      If you do not preface with ``srun`` the command is run on the login node! 
      

You can now run Julia scripts on the allocated resources directly instead of waiting for 
      your batch job to return a result. This is an advantage if you want to test your Julia 
      script or perhaps figure out which parameters are best.
                  

Example **Code along**
######################

**Requesting 4 cores for 10 minutes, then running Julia**

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: sh
      
          [bjornc@rackham2 ~]$ interactive -A naiss2023-22-44 -p core -n 4 -t 10:00
          You receive the high interactive priority.
          There are free cores, so your job is expected to start at once.
      
          Please, use no more than 6.4 GB of RAM.
      
          Waiting for job 29556505 to start...
          Starting job now -- you waited for 1 second.
          
          [bjornc@r484 ~]$ module load julia/1.8.5

      Let us check that we actually run on the compute node: 

      .. code-block:: sh
      
          [bjornc@r483 ~]$ srun hostname
          r483.uppmax.uu.se
          r483.uppmax.uu.se
          r483.uppmax.uu.se
          r483.uppmax.uu.se

      We are. Notice that we got a response from all four cores we have allocated.   

   .. tab:: HPC2N
         
      .. code-block:: sh
      
          b-an01 [~]$ salloc -n 4 --time=00:30:00 -A hpc2nXXXX-YYY
          salloc: Pending job allocation 20174806
          salloc: job 20174806 queued and waiting for resources
          salloc: job 20174806 has been allocated resources
          salloc: Granted job allocation 20174806
          salloc: Waiting for resource configuration
          salloc: Nodes b-cn0241 are ready for job
          b-an01 [~]$ module load GCC/10.3.0 OpenMPI/4.1.1 julia/1.8.5
          b-an01 [~]$ 
                  
      
      Let us check that we actually run on the compute node: 
      
      .. code-block:: sh
                  
           b-an01 [~]$ srun hostname
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
      
      We are. Notice that we got a response from all four cores we have allocated.   
      
      
Running a script
''''''''''''''''

**The script** 
      Adding two numbers from user input (serial-sum.jl)
         
      .. code-block:: julia
      
          # This program will add two numbers that are provided by the user
          
          # Get the numbers
          x = parse( Int32, ARGS[1] )
          y = parse( Int32, ARGS[2] )
          # Add the two numbers together
          summ = x + y
          println("The sum of the two numbers is ", summ)
          
      
**Running the script**

- Note that the commands are the same for both HPC2N and UPPMAX!
      
      Running a Python script in the allocation we made further up. Notice that since we asked for 4 cores, the script is run 4 times, since it is a serial script
         
      .. code-block:: sh
      
          b-an01 [~]$ srun julia serial-sum.jl 3 4
          The sum of the two numbers is: 7
          The sum of the two numbers is: 7
          The sum of the two numbers is: 7
          The sum of the two numbers is: 7
          b-an01 [~]$             
                        
      As you can see, it is possible, but it will not show any interaction it otherwise would have. This is how it would look on the login node: 
                  
      .. code-block:: sh 
                  
                  b-an01 [~]$ python add2.py 
                  Enter the first number: 2
                  Enter the second number: 3
                  The sum of 2 and 3 is 5

**Running julia REPL (UPPMAX)**

- First start julia using the 4 cores and check if workers are available

      .. code-block:: sh 
 
         $ julia -p 4
         
      .. code-block:: julia

        julia> nworkers()
        4


**Exit**

When you have finished using the allocation, either wait for it to end, or close it with ``exit``

.. tabs::

   .. tab:: UPPMAX
   
      .. code-block:: sh 
                  
                  [bjornc@r484 ~]$ exit
      
                  exit
                  [screen is terminating]
                  Connection to r484 closed.
      
                  [bjornc@rackham2 ~]$
      
      It is also possible to run IPython or (on UPPMAX) jupyter-notebook 

   .. tab:: HPC2N
   
      .. code-block:: sh 
                  
                  b-an01 [~]$ exit
                  exit
                  salloc: Relinquishing job allocation 20174806
                  salloc: Job allocation 20174806 has been revoked.
                  b-an01 [~]$

.. admonition:: Running Jupyter on compute nodes at UPPMAX

   https://uppmax.github.io/HPC-python/jupyter.html

.. keypoints::

   - Start an interactive session on a calculation node by a SLURM allocation
   
      - At HPC2N: ``salloc`` ...
      - At UPPMAX: ``interactive`` ...
   - Follow the same procedure as usual by loading the Python module and possible prerequisites.
    
