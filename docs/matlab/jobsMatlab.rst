The Slurm job scheduler and MATLAB
==================================

.. questions::

   - What is a batch job?
   - How to make a batch for MATLAB?
   
.. objectives:: 

   - Understand and use the Slurm scheduler
   - Start batch jobs from MATLAB Graphical User Interface
   - Try example

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-1202``
   - Kebnekaise: ``hpc2n2024-114``
   - Cosmos: ``lu2024-7-80``
 
.. admonition:: Storage space for this workshop 

   - Rackham: ``/proj/r-py-jl-m-rackham``
   - Kebnekaise: ``/proj/nobackup/r-py-jl-m`` 

.. warning::

   Any longer, resource-intensive, or parallel jobs must be run through a **batch script**.


.. note:: 

   - MATLAB is well integrated with SLURM and because of that there are several options to run these jobs:
       - Writing a batch script as for any other software and submitting the job with the ``sbatch`` command from SLURM 
         (This could be useful if you want to run long jobs and you don't need to modify the code in the meantime).
         You have seen this in the previous section.
       - Using the job scheduler (``batch`` command) in MATLAB Desktop/graphical interface (This is the Recommended Use).
       - Starting a ``parpool`` with a predefined cluster (This allows for more interactivity).
   - In the following sections we will extend the last two options. 


MATLAB Desktop/graphical interface
----------------------------------


.. figure:: ../img/matlab-gui.png
   :width: 450
   :align: center

   MATLAB GUI


.. warning::

   - On the login-nodes MATLAB MUST be started with the option '-singleCompThread', preventing MATLAB from using more than one thread.
  


Serial batch jobs 
''''''''''''''''''''''''''''''''''''''''''''''''''



Exercises
---------

.. keypoints::

   - **FIX**
   - The SLURM scheduler handles allocations to the calculation nodes
   - Batch jobs runs without interaction with user
   - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing the actual work within the job, for instance one or several Python scripts.
      
      - Remember to include possible input arguments to the Python script in the batch script.
    
