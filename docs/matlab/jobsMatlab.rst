MATLAB GUI and SLURM
====================

.. questions::

   - What is a batch job?
   - How to make a batch for MATLAB?
   
.. objectives:: 

   - Understand and use the Slurm scheduler
   - Start batch jobs from MATLAB Graphical User Interface (GUI)
   - Try example

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-1202``
   - Kebnekaise: ``hpc2n2024-114``
   - Cosmos: ``lu2024-7-80``
 
.. admonition:: Storage space for this workshop 

   - Rackham: ``/proj/r-py-jl-m-rackham``
   - Kebnekaise: ``/proj/nobackup/r-py-jl-m`` 

.. warning::

   - Any longer, resource-intensive, or parallel jobs must be run through a **batch script**.
   - On the login-nodes MATLAB MUST be started with the option '-singleCompThread', preventing MATLAB from using more than one thread.

.. note:: 

   - MATLAB is well integrated with SLURM and because of that there are several options to run these jobs:
       - Writing a batch script as for any other software and submitting the job with the ``sbatch`` command from SLURM 
         (This could be useful if you want to run long jobs and you don't need to modify the code in the meantime).
         You have seen this in the previous section.
       - Using the job scheduler (``batch`` command) in MATLAB graphical user interface (GUI) (This is the Recommended Use).
       - Starting a ``parpool``in the MATLAB GUI with a predefined cluster (This allows for more interactivity).
   - In the following sections we will extend the last two options. 


MATLAB Desktop/graphical interface
----------------------------------

Jobs can be submitted to the SLURM queue directly from the the MATLAB GUI as an alternative
to the standard bash scripts that are used with the command ``sbatch my-script.sh``, for instance.

.. figure:: ../img/matlab-gui.png
   :width: 450
   :align: center

   MATLAB GUI

To submit a job from the GUI, you will need to create a handler to the cluster and then use this
handler to send the job and control the outputs: 

.. code-block:: matlab

    % Get a handle to the cluster
    c=parcluster('name-of-your-cluster')
    % Run the job on CPU
    j = c.batch(@myfunction, 'nr. of output values', {'list of input arguments'},'pool','nr. workers')
    % Wait till the job has finished. Use j.State if you just want to poll the
    % status and be able to do other things while waiting for the job to finish.
    j.wait
    % Fetch the result after the job has finished
    j.fetchOutputs{:}


Serial jobs 
'''''''''''

As an example consider the following serial function ``hostnm`` that is in a file called
``hostnm.m`` which gets the name of the host machine as an output: 

.. code-block:: matlab

    function hn = hostnm()
       hn = getenv('HOSTNAME');
    end

We can send a job to the queue which executes this function and retrieving/printing out 
the results as follows:

.. code-block:: matlab

    c=parcluster('name-of-your-cluster');
    j = c.batch(@hostnm,1,{},'pool',1);
    j.wait;
    t = j.fetchOutputs{:};
    fprintf('Name of host: %s \n', t);


Parallel jobs
'''''''''''''

Jobs can be parallelized in MATLAB using functionalities such as ``parfor``, ``spmd``, and ``parfeval``.  

``parfor``
~~~~~~~~~~

``spmd``
~~~~~~~~

Single program multiple data (SPMD) is supported in MATLAB through the ``spmd`` functionality, here 
you enclose the code that will be executed by some workers independently. The workers are labeled with 
the variable ``labindex`` that can be used to control the workload of each worker. In the following
example the name of the host will be displayed as many times as the present number of workers: 

.. code-block:: matlab

    spmd
        A = labindex;              % label for each worker 
        disp(getenv("HOSTNAME"))   % display the name of the host
    end






Parallel jobs can be handled in two ways either by using the ``batch`` command we already saw or by creating
a ``parpool``. 



Using ``batch``
~~~~~~~~~~~~~~~



Creating a ``parpool``
~~~~~~~~~~~~~~~~~~~~~~



Exercises
---------

.. keypoints::

   - **FIX**
   - The SLURM scheduler handles allocations to the calculation nodes
   - Batch jobs runs without interaction with user
   - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing the actual work within the job, for instance one or several Python scripts.
      
      - Remember to include possible input arguments to the Python script in the batch script.
    
