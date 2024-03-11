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

Some users develop Python code in a line-by-line fashion. 
These users typically want to run a (calculation-heavy) 
script frequently, to test if the code works.
However, scheduling each new line is too slow, as it
can take minutes before the new code is run.
Instead, there is a way to directly work 
with such code: use an interactive session.

Some other users want to run programs that 
(1) use a lot of CPU and memory, and (2) need to be persistent/available.
One good example is Jupyter. 
Running such a program on a login nodes would
harm all other users on the login node.
Running such a program on a computer node using ``sbatch``
would not allow a user to connect to it.
In such a case: use an interactive session.

.. admonition:: **Jupyter on HPC2N is more complex**

    On HPC2N, using Jupyter on HPC2N is possible, 
    yet harder to get to work correctly.
    If you need it anyway, please contact ``support@hpc2n.umu.se``.

An interactive session is a session with direct access to a compute node.
Or alternatively: an interactive session is a session,
in which there is no queue before a command is run on a compute node.

In this session, we show how to:
- the different way HPC2N and UPPMAX provide for an interactive session
- start an interactive session
- check to be in an interactive session
- check to have booked the expected amount of cores
- end the interactive session

The different way HPC2N and UPPMAX provide for an interactive session
---------------------------------------------------------------------

.. mermaid:: interactive_node_transitions.mmd 

Here we define an interactive session as a session 
with direct access to a compute node.
Or alternatively: an interactive session is a session,
in which there is no queue before a command is run on a compute node.

This differs between HPC2N and UPPMAX:

- HPC2N: the user remains on a login node. 
  All commands can be sent directly to the compute node using ``srun``
- UPPMAX: the user is actually on a computer node.
  Whatever command is done, it is run on the compute node

Start an interactive session
----------------------------

To start an interactive session, 
one needs to allocate resources on the cluster first.

The command to request an interactive node differs per HPC cluster:

+---------+-----------------+-------------+
| Cluster | ``interactive`` | ``salloc``  |
+=========+=================+=============+
| HPC2N   | Works           | Recommended |
+---------+-----------------+-------------+
| UPPMAX  | Recommended     | Works       |
+---------+-----------------+-------------+

Start an interactive session in the simplest way
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To start an interactive session in the simplest way, is shown here:

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

Start an interactive session in a more elaborate way
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The simplest way to start an interactive session
may have some defaults settings that do not fit you:

- session duration is too short
- the session has too few cores available

Here we show how start an interactive session in a more elaborate way,
with a custom session duration and a custom amount of cores:
      
.. tabs::

   .. tab:: UPPMAX

      Here we start an interactive session on the ``devcore`` partition,
      with a custom session duration and a custom amount of cores:

      .. code-block:: console
          
         interactive -p devcore -n [n_tasks] --time=[duration] -A naiss2024-22-107

      where ``[n_tasks]`` is the number of tasks,
      ``[duration]`` is the time given in ``HHH:MM:SS`` format,
      and ``[project_name]`` is the UPPMAX project name.

      The parameters ``-p devcore`` mean that the ``devcore`` partition is used,
      which results in jobs that start either faster or just as fast. Nice!

      As an example, here an interactive job is started with 4 tasks,
      for 1 hour, for the UPPMAX project ``naiss2024-22-107``:

      .. code-block:: console

         interactive -p devcore -n 4 --time=1:00:00 -A naiss2024-22-107

      Note that, as Slurm uses 1 task per core by default, we request 4 cores.
      
   .. tab:: HPC2N

      Here we start an interactive session,
      with a custom session duration and a custom amount of cores:

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

Check to be in an interactive session
-------------------------------------

.. tabs::

   .. tab:: UPPMAX

      To check to be in an interactive session, do:

      .. code-block:: console

         hostname

      If the output is ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you are on a computer node. Well done!

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.
      
   .. tab:: HPC2N

      To check to be in an interactive session, do:

      .. code-block:: console

         srun hostname

      If the output is ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you are more-or-less on a computer node. Well done!

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.

      Misleading would be to use:

      .. code-block:: console

         hostname

      This will always show that you are on a login node


Check to have booked the expected amount of cores
-------------------------------------------------

.. tabs::

   .. tab:: UPPMAX

      To check to have booked the expected amount of cores:

      .. code-block:: console

         srun hostname

      The output should be one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.
      
   .. tab:: HPC2N

      To check to have booked the expected amount of cores:

      .. code-block:: console

         srun hostname

      The output should be one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.


End the interactive session
---------------------------

.. tabs::

   .. tab:: UPPMAX

      To end and interactive session, do:

      .. code-block:: console

         exit

      The prompt should change to contain ``rackham[number].uppmax.uu.se``, 
      where ``[number]`` is a number, which indicates you are back on a login node.
      
   .. tab:: HPC2N

      To end and interactive session, do:

      .. code-block:: console

         exit

      The prompt will remain the same.
                  
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

    - Start an interactive session with 1 core
    - Test to be on an interactive node
    - Test to be on an interactive session with 1 core
    - End an interactive session

Exercise 1.1: start an interactive node
---------------------------------------

.. tabs::

   .. tab:: Exercise 1.1: start an interactive node

   Start an interactive node in the simplest way possible.

   .. tab:: UPPMAX

      On UPPMAX, ``interactive`` is recommended:

      .. code-block:: console

         interactive -A naiss2024-22-107
      
   .. tab:: HPC2N

      .. code-block:: console
          
         salloc -A hpc2n2024-025

Exercise 1.2: check to be in an interactive session
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 1.2: confirm to be on a compute node

   Confirm to be on a compute node.

   .. tab:: UPPMAX

      Use:

      .. code-block:: console

         hostname

      If the output is ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you are on a computer node. Well done!

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.
      
   .. tab:: HPC2N

      Use:

      .. code-block:: console

         srun hostname

      If the output is ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you are more-or-less on a computer node. Well done!

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.

      Misleading would be to use:

      .. code-block:: console

         hostname

      This will always show that you are on a login node


Exercise 1.3: check to have booked the expected amount of cores
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 1.3: confirm to have booked one core

   Confirm to have booked one core.

   .. tab:: UPPMAX

      Use:

      .. code-block:: console

         srun hostname

      The output should be one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.
      
   .. tab:: HPC2N

      Use:

      .. code-block:: console

         srun hostname

      The output should be one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.

Exercise 1.4: exit
^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 1.4: exit

   Exit the interactive node

   .. tab:: UPPMAX

      Use:

      .. code-block:: console

         exit

      The prompt should change to contain ``rackham[number].uppmax.uu.se``, 
      where ``[number]`` is a number, which indicates you are back on a login node.
      
   .. tab:: HPC2N

      Use:

      .. code-block:: console

         exit

      The prompt will remain the same.


Exercise 2
----------

.. admonition:: Learning objectives

    - Start an interactive session with multiple cores
    - Test to be on an interactive node with multiple cores
    - End an interactive session


Links
-----

- `This session taught at 2023-12-01 <https://youtu.be/Rt7-sGEHrp0?si=4AB4Nu6BpLhNJXzE>`_
