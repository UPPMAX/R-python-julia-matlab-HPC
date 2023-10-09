Parallel Programming
====================


.. questions::

   - What is parallel programming?
   - Why do we need it?
   - Where I can use it?

   
   
.. objectives:: 

   - Short introduction to parallel programming
   - Common paradigms to write a parallel code

    

What is parallel programming?
-----------------------------

Parallel programming is the art of writing code that execute tasks on different
computing units (cores) simultaneously. In the past computers were shiped with a
single core per Central Processing Unit (CPU) and therefore it could only perform
a single computation at the time (serial program).

Nowadays computer architechures are more complex than the single core CPU mentioned
already. For instance, common architectures include those where several cores in a
CPU share a common memory space and also those where CPUs are connected through some
network interconnect.

.. figure:: ../../img/shared-distributed-mem.svg
   :width: 450
   :align: center

   Shared Memory and Distributed Memory architectures.
 
A more realistic picture of a computer architecture can be seen in the following 
picture where we have 14 cores that shared a common memory of 64 GB. These cores
form the socket and the two sockets shown in this picture constitute a node.

.. figure:: ../../img/cpus.png
   :width: 450
   :align: center

   1 standard node on Kebnekaise @HPC2N 

Both architectures have their 

Why is parallel programming needed?
-----------------------------------



.. figure:: ../../img/workflow-hpc.svg
   :width: 550
   :align: center

   Two-language problem where Julia is shown as a bridge between the languages
   in the traditional paradigms, productivity vs. performance. 




As you probably already know…
    
            
.. tabs::

   .. tab:: Serial

        Short serial example script for Rackham. Loading Python 3.9.5. Numpy is preinstalled and does not need to be loaded. 

        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss2023-22-44 # Change to your own after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            

   .. tab:: Python

        Short serial example for running on Kebnekaise. Loading SciPy-bundle/2021.05 and Python/3.9.5  
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2nXXXX-YYY # Change to your own after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            
            
   .. tab:: Julia 
   
        Python example code
   
        .. code-block:: python
        
            import timeit
            import numpy as np


   .. tab:: R 
   
        Python example code
   
        .. code-block:: python
        
            import timeit
            import numpy as np


- Official Python documentation is found here https://www.python.org/doc/ .
- `Wikipedias' article on Parallel Computing <https://en.wikipedia.org/wiki/Parallel_computing>`_ 
- The book `High Performance Python <https://www.oreilly.com/library/view/high-performance-python/9781492055013/>`_ is a good resource for ways of speeding up Python code.
    

