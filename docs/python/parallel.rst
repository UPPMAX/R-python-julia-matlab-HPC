Parallel Programming
====================


.. questions::

   - What is a batch job?
   - How to make a batch job?

   
   
.. objectives:: 

   - Short introduction to SLURM scheduler
   - Show structure of a batch script
   - Try example


    

What is python?
---------------

.. figure:: ../../img/workflow-hpc.svg
   :width: 450
   :align: center

   Two-language problem where Julia is shown as a bridge between the languages
   in the traditional paradigms, productivity vs. performance. 




.. figure:: ../../img/shared-distributed-mem.svg
   :width: 450
   :align: center

   Two-language problem where Julia is shown as a bridge between the languages
   in the traditional paradigms, productivity vs. performance. 


.. figure:: ../../img/cpus.png
   :width: 450
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
- Python forum is found here https://python-forum.io/ .
- A nice introduction to packages can be found here: https://aaltoscicomp.github.io/python-for-scicomp/dependencies/
- CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Ther material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
- The youtube video `Thinking about Concurrency <https://www.youtube.com/watch?v=Bv25Dwe84g0>`_ is a good introduction to writing concurrent programs in Python 
- The book `High Performance Python <https://www.oreilly.com/library/view/high-performance-python/9781492055013/>`_ is a good resource for ways of speeding up Python code.
    

