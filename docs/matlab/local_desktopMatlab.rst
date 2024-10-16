Session: MATLAB client on the desktop
=====================================

.. admonition:: Use own computer's matlab

   - Would you like to try run batch jobs on the Rackham or Snowy cluster but use the faster graphics that you can achieve on your own computer?
   - UPPMAX offers this now.

.. warning::

   - This solution is possible only if
      - you have an UPPMAX compute project and 
      - a working matlab on your computer with one of the version available on the cluster:
         - check with ``module avail matlab``
         - Examples of the newest ones: 
            - R2020b
            - R2022a
            - R2022b
            - R2023a
            - R2023b


Let's get started together!
---------------------------

.. demo::

   - You can try to type-along

The Rackham MATLAB support package can be found at `uppsala.Desktop.zip <https://github.com/UPPMAX/UPPMAX-documentation/raw/main/docs/software/files/matlab/uppsala.Desktop.zip>`_.



- Download the ZIP file and start MATLAB.
- The ZIP file should be unzipped in the location returned by calling

.. code-block:: matlab

   >> userpath

- You can unzip from MATLAB's Command window.

- Configure MATLAB to run parallel jobs on the cluster by calling ``configCluster``. ``configCluster`` only needs to be called once per version of MATLAB.

.. code-block:: matlab

   >> configCluster
   Username on RACKHAM (e.g. jdoe):  

- Type your rackham user name.
- As a result the following 

.. code-block:: matlab 
   
   Complete.  Default cluster profile set to "Rackham R2022b".


.. note:: 

   - To submit to the local machine instead of the cluster, run the following:

   .. code-block:: matlab

      >> % Get a handle to the local resources
      >> c = parcluster('local');


CONFIGURING JOBS
................

Prior to submitting the job, various parameters can be assigned, such as queue, e-mail, walltime, etc.  The following is a partial list of parameters.  See AdditionalProperties for the complete list.  Only AccountName, Partition, MemUsage and WallTime.

.. code-block:: matlab

   >> % Get a handle to the cluster
   >> c = parcluster;

   c = 

    Generic Cluster

       Properties: 

                      Profile: Rackham R2022b
                     Modified: false
                         Host: UUC-4GM8L33.user.uu.se
                   NumWorkers: 100000
                   NumThreads: 1

        JobStorageLocation: <path to job outputs locally>
         ClusterMatlabRoot: /sw/apps/matlab/x86_64/R2022b
           OperatingSystem: unix

Set some additional parameters related to Slurm on Rackham

.. code-block: matlab

   >> % Specify the account
   >> c.AdditionalProperties.AccountName = 'naiss2024-22-1202';

   >> % Specify the partition
   >> c.AdditionalProperties.Partition = 'devcore';

   >> % Specify the wall time (e.g., 1 day, 5 hours, 30 minutes
   >> c.AdditionalProperties.WallTime = '00:30:00';

   [OPTIONAL]

   >> % Specify cores per node
   >> c.AdditionalProperties.ProcsPerNode = 4;

   >> % Use reservation 
   >> c.AdditionalProperties.Reservation = 'reservation-name';

   >> % Specify number of GPUs
   >> c.AdditionalProperties.GPUsPerNode = 1;
   >> c.AdditionalProperties.GPUCard = 'gpu-card';

- Submission to the cluster requires SSH credentials. 
- You will be prompted for username and password or identity file (private key).  -
- The username and location of the private key will be stored in MATLAB for future sessions.
- Jobs will now default to the cluster rather than submit to the local machine.



Save changes after modifying AdditionalProperties for the above changes to persist between MATLAB sessions.

.. code-block:: matlab

   >> c.saveProfile

To see the values of the current configuration options, display AdditionalProperties.

.. code-block:: matlab

   >> % To view current properties
   >> c.AdditionalProperties

Unset a value when no longer needed.

.. code-block:: matlab

   >> % Example Turn off email notifications
   >> c.AdditionalProperties.EmailAddress = '';
   >> c.saveProfile

- check the queue on rackham

.. code-block:: console

   [bjornc2@rackham2 ~]$ squeue -u bjornc2
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
          50827312   devcore MATLAB_R  bjornc2  R       2:20      1 r483


