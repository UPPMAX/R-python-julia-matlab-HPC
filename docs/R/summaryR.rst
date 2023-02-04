Summary
==============

.. keypoints::

   - Load and run
   - Packages
      - Check for preinstalled packages
      - Installation with *PYPI*     
   - Isolated environments 
      - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
      - Make it for each project you have for reproducibility.
      - There are different tools to create virtual environemnts.

   - Batch mode
      - The SLURM scheduler handles allocations to the calculation nodes
      - Batch jobs runs without interaction with user
      - A batch script consists of a part with *SLURM parameters* describing the allocation and a second part describing the actual work within the job, for instance one or several Python scripts.
      - Remember to include possible input arguments to the Python script in the batch script.
   
   - Interactive work on calculation nodes
      - Start an interactive session on a calculation node by a SLURM allocation (similar flags)
         - At HPC2N: ``salloc`` ...
         - At UPPMAX: ``interactive`` ...
      - Follow the same procedure as usual by loading the Python module and possible prerequisites.

   - Parallel
      - You deploy cores and nodes via SLURM, either in interactive mode or batch
      - **FIX** In Python, threads, distributed and MPI parallelization can be used.

   - GPUs
      -  You deploy GPU nodes via SLURM, either in interactive mode or batch
      -  **FIX** In Python the numba package is handy

.. challenge:: Not really clear? (5 min)

    - Discuss in breakout rooms
    - Learn from each other

.. seealso::

    - **FIX**
    - For other topics, see python documentation https://www.python.org/doc/. 
    - Python forum is found here https://python-forum.io/.
    - A nice introduction to packages can be found here: https://aaltoscicomp.github.io/python-for-scicomp/dependencies/
    - CodeRefinery develops and maintains training material on software best practices for researchers that already write code. 
    
      - Their material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
    
.. note::
    
    - **FIX**
    - Julia language becomes increasingly popular.
    - We also have a web page for Julia at UPPMAX: https://uppmax.uu.se/support/user-guides/julia-user-guide/
    
    
