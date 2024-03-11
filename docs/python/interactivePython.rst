Interactive work on the compute nodes
=====================================

.. tabs::

   .. tab:: Learning objectives

      - Understand what an interactive session is
      - Understand why one may need an interactive session
      - Start an interactive session
      - Test to be on an interactive node
      - End an interactive session
      - Start an interactive session with multiple cores
      - Test to be on an interactive node with multiple cores
      - End an interactive session with multiple cores

   .. tab:: For teachers

      Teaching goals are:

      - Learners have heard what an interactive session is
      - Learners have heard why one may need an interactive session
      - Learners have started an interactive session
      - Learners have tested to be on an interactive node
      - Learners have ended an interactive session
      - Learners have started an interactive session with multiple cores
      - Learners have tested to be on an interactive node with multiple cores
      - Learners have ended an interactive session with multiple cores

      Lesson plan:

      - 5 mins: prior knowledge
         - What types of nodes do our HPC clusters have?
         - What is the purpose of each of these nodes?
         - Imagine you are developing a Python script in a line-by-line fashion. How to do so best?
         - Why not do so on the login node?
         - Why not do so by using ``sbatch``?
      - 5 mins: presentation
      - 20 mins: challenge
      - 5 mins: feedback
         - What is the drawback of using an interactive node?

.. note::

   - It is possible to run Python directly on the login (including ThinLinc) nodes.
   - But this should *only* be done for shorter jobs or jobs that do not use a lot of resources, as the login nodes can otherwise become slow for all users. Both Python and IPython exists as modules to load and run.
   - If you want to work interactively with your code or data, you should start an interactive session.
   - If you rather will run a script which won't use any interactive user input while running, you can instead start a batch job, see next session.
   
.. questions::

   - How to reach the calculation nodes
   - How do I proceed to work interactively?
   
.. objectives:: 

   - Show how to reach the calculation nodes on UPPMAX and HPC2N
   - Test some commands on the calculation nodes

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-107``
   - Kebnekaise: ``hpc2n2024-025``


Introduction
------------

There are several ways to run Python interactively:

- Directly on the login nodes: **only** do this for short jobs that do not take a lot of resources
- As an interactive job on the computer nodes, launched via the batch system
- For UPPMAX: using Jupyter notebooks

In order to run interactively, you need to have 
compute nodes allocated to run on, and this is done through the batch system.  

Because you will have to wait until the nodes are allocated, 
and because you cannot know when this happens, 
this is not usually a recommended way to run Python, but it is possible. 

.. warning::

    (HPC2N) Do note that it is not *real* interactivity as you probably mean it, 
   as you will have to run it as a Python script instead of by starting Python 
   and giving commands inside it. 
   The reason for this is that you are not actually logged into the compute node 
   and only sees the output of the commands you run. 

Another option would be to use Jupyter notebooks. 
This option will be covered under the UPPMAX separate sessions.
This is somewhat convoluted to get to work correctly at HPC2N, but possible. 
Please contact us at support@hpc2n.umu.se if you want to go this route at HPC2N. 

Python "interactively" on the compute nodes 
-------------------------------------------

.. mermaid:: interactive_node_transitions.mmd 

To run interactively, you need to allocate resources on the cluster first. 

The command to request an interactive node differs per HPC cluster:

+---------+-----------------+-------------+
| Cluster | ``interactive`` | ``salloc``  |
+=========+=================+=============+
| HPC2N   | Works           | Recommended |
+---------+-----------------+-------------+
| UPPMAX  | Recommended     | Works       |
+---------+-----------------+-------------+

To start an interactive node in the simplest way, is shown here:

.. tabs::

   .. tab:: UPPMAX

     Use:

      .. code-block:: console

         interactive -A [project_name]

      Where ``[project_name]`` is the UPPMAX project name,
      for example ``interactive -A naiss2024-22-107``.
      
   .. tab:: HPC2N

      .. code-block:: console
          
         salloc -A [project_name]

      Where ``[project_name]`` is the HPC2N project name,
      for example ``interactive -A hpc2n2024-025``.

Indeed, all you need is the UPPMAX/HPC2N project name.
However, this simplest way may have some defaults settings 
that do not fit you.

To start an interactive node in a more elaborate way, is shown here:
      
.. tabs::

   .. tab:: UPPMAX

      .. code-block:: console
          
         interactive -n [n_tasks] --time=[duration] -A naiss2024-22-107

      where ``[n_tasks]`` is the number of tasks,
      ``[duration]`` is the time given in ``HHH:MM:SS`` format,
      and ``[project_name]`` is the UPPMAX project name.

      As an example, here an interactive job is started with 4 tasks,
      for 1 hour, for the UPPMAX project ``naiss2024-22-107``:

      .. code-block:: console

         interactive -n 4 --time=1:00:00 -A naiss2024-22-107

      Note that, as Slurm uses 1 task per core by default, we request 4 cores.
      
   .. tab:: HPC2N

      .. code-block:: console
          
         interactive -n [n_tasks] --time=[duration] -A naiss2024-22-107

      where ``[n_tasks]`` is the number of tasks,
      ``[duration]`` is the time given in ``HHH:MM:SS`` format,
      and ``[project_name]`` is the HPC2N project name.

      As an example, here an interactive job is started with 4 tasks,
      for 1 hour, for the HPC2N project ``hpc2n2024-025``:

      .. code-block:: console
          
         salloc -n 4 --time=1:00:00 -A hpc2n2024-025

      Note that, as Slurm uses 1 task per core by default, we request 4 cores.


Your request enters the job queue just like any other job, and interactive/salloc will tell you that it is
      waiting for the requested resources. When salloc tells you that your job has been allocated 
      resources, you can interactively run programs on those resources with ``srun``. The commands 
      you run with ``srun`` will then be executed on the resources your job has been allocated. 
      If you do not preface with ``srun`` the command is run on the login node! 
      

You can now run Python scripts on the allocated resources directly instead of waiting for 
      your batch job to return a result. This is an advantage if you want to test your Python 
      script or perhaps figure out which parameters are best.

When you have request multiple cores for your interactive session,
you need to preface commands with ``srun`` in order to 
run on the allocated nodes instead of the login node. 
                  
Example
#######

.. tip::
    
   **Code along!**

**Requesting 4 cores for 10 minutes, then running Python**

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: console
      
          [bjornc@rackham2 ~]$ interactive -A naiss2024-22-107 -p devcore -n 4 -t 10:00
          You receive the high interactive priority.
          There are free cores, so your job is expected to start at once.
      
          Please, use no more than 6.4 GB of RAM.
      
          Waiting for job 29556505 to start...
          Starting job now -- you waited for 1 second.
          
          [bjornc@r484 ~]$ module load python/3.11.8

      Let us check that we actually run on the compute node: 

      .. code-block:: console
      
          [bjornc@r483 ~]$ srun hostname
          r483.uppmax.uu.se
          r483.uppmax.uu.se
          r483.uppmax.uu.se
          r483.uppmax.uu.se

      We are. Notice that we got a response from all four cores we have allocated.   

   .. tab:: HPC2N
         
      .. code-block:: console
      
          b-an01 [~]$ salloc -n 4 --time=00:10:00 -A hpc2n2024-025 
          salloc: Pending job allocation 20174806
          salloc: job 20174806 queued and waiting for resources
          salloc: job 20174806 has been allocated resources
          salloc: Granted job allocation 20174806
          salloc: Waiting for resource configuration
          salloc: Nodes b-cn0241 are ready for job
          b-an01 [~]$ module load GCC/12.3.0 Python/3.11.3
          b-an01 [~]$ 
                  
      
      Let us check that we actually run on the compute node: 
      
      .. code-block:: console
                  
           b-an01 [~]$ srun hostname
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
      
      We are. Notice that we got a response from all four cores we have allocated.   
      
      
**I am going to use the following two Python codes for the examples:**
      
      Adding two numbers from user input (add2.py)
         
      .. code-block:: python
      
          # This program will add two numbers that are provided by the user
          
          # Get the numbers
          a = int(input("Enter the first number: ")) 
          b = int(input("Enter the second number: "))
          
          # Add the two numbers together
          sum = a + b
          
          # Output the sum
          print("The sum of {0} and {1} is {2}".format(a, b, sum))
      
      Adding two numbers given as arguments (sum-2args.py)
         
      .. code-block:: python
      
          import sys
          
          x = int(sys.argv[1])
          y = int(sys.argv[2])
          
          sum = x + y
          
          print("The sum of the two numbers is: {0}".format(sum))
      
**Now for running the examples:**

- Note that the commands are the same for both HPC2N and UPPMAX!
      
      1. Running a Python script in the allocation we made further up. Notice that since we asked for 4 cores, the script is run 4 times, since it is a serial script
         
      .. code-block:: console
      
          b-an01 [~]$ srun python sum-2args.py 3 4
          The sum of the two numbers is: 7
          The sum of the two numbers is: 7
          The sum of the two numbers is: 7
          The sum of the two numbers is: 7
          b-an01 [~]$             
                  
      2. Running a Python script in the above allocation, but this time a script that expects input from you.
         
      .. code-block:: console            
          
          b-an01 [~]$ srun python add2.py 
          2
          3
          Enter the first number: Enter the second number: The sum of 2 and 3 is 5
          Enter the first number: Enter the second number: The sum of 2 and 3 is 5
          Enter the first number: Enter the second number: The sum of 2 and 3 is 5
          Enter the first number: Enter the second number: The sum of 2 and 3 is 5
      
      As you can see, it is possible, but it will not show any interaction it otherwise would have. This is how it would look on the login node: 
                  
      .. code-block:: console 
                  
                  b-an01 [~]$ python add2.py 
                  Enter the first number: 2
                  Enter the second number: 3
                  The sum of 2 and 3 is 5
      

**Exit**

When you have finished using the allocation, either wait for it to end, or close it with ``exit``

.. tabs::

   .. tab:: UPPMAX
   
      .. code-block:: console 
                  
                  [bjornc@r484 ~]$ exit
      
                  exit
                  [screen is terminating]
                  Connection to r484 closed.
      
                  [bjornc@rackham2 ~]$
      
      It is also possible to run IPython or (on UPPMAX) jupyter-notebook 

   .. tab:: HPC2N
   
      .. code-block:: console 
                  
                  b-an01 [~]$ exit
                  exit
                  salloc: Relinquishing job allocation 20174806
                  salloc: Job allocation 20174806 has been revoked.
                  b-an01 [~]$

.. admonition:: Running Jupyter on compute nodes at UPPMAX

   https://uppmax.github.io/HPC-python/jupyter.html

.. admonition:: Running Jupyter on compute nodes at HPC2N

   https://www.hpc2n.umu.se/resources/software/jupyter

.. keypoints::

   - Start an interactive session on a calculation node by a SLURM allocation
      - At HPC2N: ``salloc`` ...
      - At UPPMAX: ``interactive`` ...
   - Follow the same procedure as usual by loading the Python module and possible prerequisites.
    

Exercises
---------

In these exercises, we start two interactive sessions:

- a minimal interactive session
- a more optimized interactive session

Exercise 1
----------

.. admonition:: Learning objectives

    - Start an interactive session
    - Test to be on an interactive node
    - End an interactive session

.. tabs::

   .. tab:: Exercise 1: start an interactive node

   Start an interactive node in the simplest way possible.

   .. tab:: UPPMAX

      On UPPMAX, ``interactive`` is recommended:

      .. code-block:: console

         interactive -A naiss2024-22-107
      
   .. tab:: HPC2N

      .. code-block:: console
          
         salloc -A hpc2n2024-025


Exercise 2
----------

.. admonition:: Learning objectives

    - Start an interactive session with multiple cores
    - Test to be on an interactive node with multiple cores
    - End an interactive session

