The Slurm job scheduler and MATLAB
==================================

.. questions::

   - What is a batch job?
   - How to make a batch job for MATLAB?
   
.. objectives:: 

   - Understand and use the Slurm scheduler
   - Start (Matlab) batch jobs from the command line
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

The batch system used at UPPMAX, HPC2N, and LUNARC is called SLURM. The same is the case at most of the Swedish HPC centres. 

SLURM is an Open Source job scheduler, which provides three key functions:

- Keeps track of available system resources
- Enforces local system resource usage and job scheduling policies
- Manages a job queue, distributing work across resources according to policies

.. note:: 

   - If you have attended the other days you have learned that you ask for compute resources via the sbatch command.
       - In order to run a batch job, you need to create and submit a SLURM submit file (also called a batch submit file, a batch script, or a job script).
       - Guides and documentation at: https://docs.hpc2n.umu.se/documentation/batchsystem/intro/ and https://docs.uppmax.uu.se/cluster_guides/slurm/ and https://lunarc-documentation.readthedocs.io/en/latest/manual/submitting_jobs/manual_basic_job/  
   - MATLAB is well integrated with SLURM and because of that there are several ways to run these jobs:
       - Using the job scheduler (``batch`` command) in MATLAB Desktop/graphical interface (This is the Recommended Use).
       - Starting a ``parpool`` with a predefined cluster (This allows for more interactivity).
       - Writing a batch script as for any other software and submitting the job with the ``sbatch`` command from SLURM 
         (This could be useful if you want to run long jobs and you don't need to modify the code in the meantime).
   - In the following sections we will extend these concepts. 

First time configuration
------------------------

In order to be able to submit jobs to the SLURM queue, you need to configure MATLAB:

.. admonition:: Follow these instructions to configure MATLAB

   - `HPC2N <https://www.hpc2n.umu.se/resources/software/configure-matlab-2018>`_
   - `UPPMAX <https://docs.uppmax.uu.se/software/matlab/#first-time-since-may-13-2024>`_
   - `LUNARC <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/MATLAB/#configuration-at-the-command-line>`_

- To be able to use MATLAB 2019b, and later, together with the batch system, MATLAB needs to be configured to use a cluster profile.
- This needs to be done only once for each cluster and each version of MATLAB.

.. admonition:: configCluster.sh

   Run 
   
   .. code-block:: 

      configCluster.sh
  
   on the terminal, after loading the MATLAB version you want. 

**Example (HPC2N):** 

.. figure:: ../../img/configcluster.png
   :width: 350
   :align: center


.. exercise::

   Login to HPC2N/UPPMAX/LUNARC, load the newest version of MATLAB (find with ``ml spider MATLAB``), and then run ``configCluster.sh`` on the command line.  

MATLAB Desktop/graphical interface
----------------------------------


.. figure:: ../img/matlab-gui.png
   :width: 350
   :align: center

   MATLAB GUI

MATLAB terminal interface
-------------------------

.. admonition:: Content

   - starting Matlab on the command line
   - Job settings
     - ``c.parcluster``
     - ``c.AdditionalProperties.``
     - ``c.batch``
     - ...

Starting MATLAB
'''''''''''''''
     
To start Matlab on the command line, without running the GUI, load the MATLAB version and do 

.. code-block::

   matlab -singleCompThread -nodisplay -nosplash -nodesktop

**Working in MATLAB**

Of course, we can work in MATLAB like this in exactly the same way as in the GUI: 

.. code-block::
 
   $ matlab -singleCompThread -nodisplay -nosplash -nodesktop
   Opening log file:  /home/b/bbrydsoe/java.log.43927

                                     < M A T L A B (R) >
                           Copyright 1984-2023 The MathWorks, Inc.
                      R2023a Update 4 (9.14.0.2306882) 64-bit (glnxa64)
                                        June 19, 2023

 
   To get started, type doc.
   For product information, visit www.mathworks.com.
 
   >> a = [ 1 2 3 ; 4 5 6; 7 8 9];
   >> b = [ 7 5 6 ; 2 0 8; 5 7 1];
   >> c = a + b

   c =

        8     7     9
        6     5    14
       12    15    10

   >> d = a - b

   d =

       -6    -3    -3
        2     5    -2
        2     1     8

   >> e = c + d;
   >> e 

   e =

        2     4     6
        8    10    12
       14    16    18

   >> 

However, we are now going to look at running in batch on the compute nodes. 

Job settings
''''''''''''

If you want to run a MATLAB program on the cluster with batch, you have to set some things for the job. Start MATLAB and do this.  

.. code-block::

   >> c=parcluster('CLUSTER');
   >> c.AdditionalProperties.AccountName = 'PROJECT-ID';
   >> c.AdditionalProperties.WallTime = 'HHH1:MM:SS';
   >> c.saveProfile; 

**Example, for HPC2N**

Asking for 1 hour walltime. 

.. code-block:: 

   >> c=parcluster('kebnekaise');
   >> c.AdditionalProperties.AccountName = 'hpc2n2024-114';
   >> c.AdditionalProperties.WallTime = '01:00:00';
   >> c.saveProfilei;

.. exercise:: Run job settings

   Do the job settings on HPC2N (kebnekaise)/UPPMAX (rackham)/LUNARC (cosmos). 
   Remember, the project-id is:
   - Rackham: naiss2024-22-1202
   - Kebnekaise: hpc2n2024-114
   - Cosmos: lu2024-7-80 

   Since we are just doing a short test, you can use 15 min instead of 1 hour as I did.   

Running a job
'''''''''''''

Starting a simple MATLAB program inside MATLAB on the terminal. It will as default use your cluster profile which you just created and saved above. 

.. code-block::

   job = batch('myScript');

batch does not block MATLAB and you can continue working while computations take place.

If you want to block MATLAB until the job finishes, use the wait function on the job object.

.. code-block::

   wait(job);

By default, MATLAB saves the Command Window output from the batch job to the diary of the job. To retrieve it, use the diary function.

.. code-block:: 

   diary(job)

After the job finishes, fetch the results by using the load function.

.. code-block::

   load(job,'x');
   
or with 

.. code-block::

   job.fetchOutputs{:}

- If you need the Job id, run ``squeue --me`` on the command line.
- To get the MATLAB  jobid do ``id=job.ID`` within MATLAB. 
- To see if the job is running, inside MATLAB, do ``job.State``


To make a pool of workers, and to give input etc. 

.. code-block::

   >> job = c.batch(@SCRIPT, #output, {input1, input2, input3, ...}, 'pool', #workers);

**Example:**

Running a simple Matlab script, parallel-example.m, giving the input "16", creating 4 workers, expecting 1 output. I use ``j`` instead of ``job`` to show that you can name as you want. 

.. code-block::

   >> j = c.batch(@parallel_example, 1, {16}, 'pool', 4);

Let us try running this on Kebnekaise, including checking state and then getting output:

.. code-block::

   >> j = c.batch(@parallel_example, 1, {16}, 'pool', 4);                            

   additionalSubmitArgs =

      '--ntasks=5 --cpus-per-task=1 -A hpc2n2024-114 -t 01:00:00'

   >> j.State

   ans =

       'running'

   >> j.State

   ans =

       'finished'
       
   >> j.fetchOutputs{:}

   ans =

       9.3387

   >>

.. exercise:: Try the above example. 

   It should work on all the clusters. 
   
   This exercise assumes you did the previous ones on this page; loading MATLAB, doing the configCluster.sh, adding the job settings. 
   
   You can download <a href="https://raw.githubusercontent.com/UPPMAX/R-python-julia-matlab-HPC/refs/heads/main/exercises/matlab/parallel_example.m" target="_blank">the parallel_example.m here</a>.  

There is more information about batch jobs here on <a href="https://se.mathworks.com/help/parallel-computing/batch.html" target="_blank">Mathworks</a>.
   
MATLAB batch jobs
-----------------



.. warning::

   - On the login-nodes MATLAB MUST be started with the option '-singleCompThread', preventing MATLAB from using more than one thread.
   - ``parpool`` can only be used on UPPMAX and Cosmos.
  
Useful commands to the batch system
-----------------------------------

- Submit job: ``sbatch <jobscript.sh>``
- Get list of your jobs: ``squeue -u <username>``
- Check on a specific job: ``scontrol show job <job-id>``
- Delete a specific job: ``scancel <job-id>``
- Useful info about a job: ``sacct -l -j <job-id> | less -S``
- Url to a page with info about the job (Kebnekaise only): ``job-usage <job-id>``

Serial batch jobs 
''''''''''''''''''''''''''''''''''''''''''''''''''

GPU code
''''''''


Exercises
---------

.. keypoints::

   - **FIX**
   - The SLURM scheduler handles allocations to the calculation nodes
   - Batch jobs runs without interaction with user
   - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing the actual work within the job, for instance one or several Python scripts.
      
      - Remember to include possible input arguments to the Python script in the batch script.
    
