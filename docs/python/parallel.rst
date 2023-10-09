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
   :width: 550
   :align: center

   Shared Memory and Distributed Memory architectures.
 
A more realistic picture of a computer architecture can be seen in the following 
picture where we have 14 cores that shared a common memory of 64 GB. These cores
form the socket and the two sockets shown in this picture constitute a node.

.. figure:: ../../img/cpus.png
   :width: 550
   :align: center

   1 standard node on Kebnekaise @HPC2N 

It is interesting to notice that there are different types of memory that are
available for the cores, ranging from the L1 cache to the node's memory for a single
node. In the former, the bandwidth can be TB/s while in the latter GB/s.

Now you can see that on a single node you already have several computing units
(cores) and also a hierarchy of memory resources which is denoted as Non Uniform
Memory Access (NUMA).

Why is parallel programming needed?
-----------------------------------

There is no "free lunch" when trying to use features (computing/memory resources) in
modern architectures. If you want your code to be aware of those features, you will
need to either add them explicitly (by coding them yourself) or implicitly (by using
libraries that were coded by others).

In your local machine, you may have some number of cores available and some memory 
attached to them which can be exploited by using a parallell program. There can be
some limited resources for running your data-production simulations as you may use
your local machine for other purposes such as writing a manuscript, making a presentation,
etc. One alternative to your local machine can be a High Performance Computing (HPC)
cluster another could be a cloud service. A common layout for the resources in an
HPC cluster is a shown in the figure below.

.. figure:: ../../img/workflow-hpc.svg
   :width: 550
   :align: center

   High Performance Computing (HPC) cluster.

Although a serial application can run in such a cluster, it would not gain much of the
HPC resources. The situation would be similar to turn on many washing machines to wash
a single item, we can waste energy easily.

.. figure:: ../../img/laundry-machines.svg
   :width: 550
   :align: center

   Under-using a cluster.


Common parallel programming paradigms
-------------------------------------

Now the question is how to take advantage of modern architectures which consist of many-cores,
interconnected through networks, and that have different types of memory available?
Python, Julia, and R languages have different tools and libraries that can help you
to get more from your local machine or HPC cluster resources.

Threaded programing
'''''''''''''''''''

To take advantage of the shared memory of the cores, **threaded** mechanisms can be used.
Low-level programming languages, such as Fortra/C/C++, use OpenMP as the standard
application programming interface (API) to parallelize programs by using a threaded mechanism.
Here, all threads have access to the same data and can do computations simultaneously. 
Higher-level languages have their own mechanisms to generate threads and this can be
confusing especially if the code is using external libraries, linear algebra for instance
(LAPACK, BLAS, ...). These libraries have their own threads (OpenMP for example) and
the code you are writing can also have some threded mechanism such as `Julia threads`.
Due to a locking mechanism in Python, `Python threads` are not efficient for computation.
However, the `Mojo project <https://docs.modular.com/mojo/notebooks/Mandelbrot.html#benchmarking>`_
is striving to leverage the threaded parallelism in Python.
            
From the previous paragraph we infere that without doing any modification to our code
we can get the benefits from parallel computing by turning-on/off external libraries,
by setting environment variables such as `OMP_NUM_THREADS`.

Distributed programing
''''''''''''''''''''''

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
    

