Load and run Julia
===================

At both UPPMAX and HPC2N we call the applications available via the module system modules. 
    - https://www.uppmax.uu.se/resources/software/module-system/ 
    - https://www.hpc2n.umu.se/documentation/environment/lmod 

   
.. objectives:: 

   - Show how to load Julia
   - Show how to run Julia scripts and start the Julia command line

.. admonition:: Short cheat sheet
    :class: dropdown 
    
    - See which modules exists: ``module spider`` or ``ml spider``
    - Find module versions for a particular software: ``module spider <software>``
    - Modules depending only on what is currently loaded: ``module avail`` or ``ml av``
    - See which modules are currently loaded: ``module list`` or ``ml``
    - Load a module: ``module load <module>/<version>`` or ``ml <module>/<version>``
    - Unload a module: ``module unload <module>/<version>`` or ``ml -<module>/<version>``
    - More information about a module: ``module show <module>/<version>`` or ``ml show <module>/<version>``
    - Unload all modules except the 'sticky' modules: ``module purge`` or ``ml purge``
    
.. warning::
   Note that the module systems at UPPMAX and HPC2 are slightly different. While all modules at UPPMAX not directly related to bio-informatics are shown by ``ml avail``, modules at HPC2N are hidden until one has loaded a prerequisite like the compiler ``GCC``.

- For reproducibility reasons, you should always load a specific version of a module instead of just the default version (often the latest)

Check for Julia versions
-------------------------


.. tabs::

   .. tab:: UPPMAX

     Check all available Python versions with:

      .. code-block:: sh

          $ module avail julia


   .. tab:: HPC2N
   
      Check all available version Julia versions with:

      .. code-block:: sh
 
         $ module spider julia
      
      To see how to load a specific version of Julia, including the prerequisites, do 

      .. code-block:: sh
   
         $ module spider Julia/<version>

      Example for Julia 1.8.5

      .. code-block:: sh

         $ module spider Julia/1.8.5

.. admonition:: Output at UPPMAX as of Jan 23 2023 **FIX**
   :class: dropdown
    
       .. code-block::  tcl
    
          $ module av julia
          ------------------------------------- /sw/mf/rackham/compilers -------------------------------------
             julia/1.0.5_LTS    julia/1.1.1    julia/1.4.2    julia/1.6.1    julia/1.6.3    julia/1.7.2 (D)

           Where:
            D:  Default Module

          Use "module spider" to find all possible modules and extensions.
          Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".


.. admonition:: Output at HPC2N as of 27 July 2022
    :class: dropdown

        .. code-block:: tcl

           b-an01 [~]$ module spider Python
           ------------------------------------------------------------------------------------------------
             Julia:
           ------------------------------------------------------------------------------------------------
             Description:
               Julia is a high-level, high-performance dynamic programming language for numerical
               computing

             Versions:
                Julia/1.5.3-linux-x86_64
                Julia/1.7.1-linux-x86_64
                Julia/1.8.5-linux-x86_64

           ------------------------------------------------------------------------------------------------
             For detailed information about a specific "Julia" package (including how to load the modules) use the module's full name.
             Note that names that have a trailing (E) are extensions provided by other modules.
             For example:

                $ module spider Julia/1.8.5-linux-x86_64
           ------------------------------------------------------------------------------------------------


Load a Julia module
--------------------

For reproducibility, we recommend ALWAYS loading a specific module instad of using the default version! 

For this course, we recommend using Julia 1.8.X

.. tabs::

   .. tab:: UPPMAX
   
      Go back and check which Python modules were available. To load version 1.8.5, do:

      .. code-block:: sh

        $ module load julia/1.8.5
        
      Note: Lowercase ``j``.
      For short, you can also use: 

      .. code-block:: sh

         $ ml julia/1.8.5

 
   .. tab:: HPC2N

 
      .. code-block:: sh

         $ module load Julia/1.8.5-linux-x86_64

      Note: Uppercase ``J``.   
      For short, you can also use: 

      .. code-block:: sh

         $ ml Julia/1.8.5-linux-x86_64


Run
---

Run Julia script
################

You can run a python script in the shell like this:

.. code-block:: sh

   $ julia example.jl
    
More information will follow later in the course on running Julia from within a **batch job**. 

Run Julia as a session
######################

.. code-block:: sh

   $ julia 

The julia prompt looks like this:

.. code-block:: julia
   
   julia> 

Exit with 

.. code-block:: julia

   <Ctrl-D> or 
   exit()


.. admonition:: Workflow  FIX **MOVE TO LATER**

   In addition to loading Julia, you will also often need to load site-installed modules for Python packages, or use own-installed Python packages. The work-flow would be something like this: 
   
 
   1) Load Julia: `module load julia/<version>`` ``Julia`` at HPC2N
   2) Load site-installed Julia packages (optional): ``module load <pre-reqs> <python-package>/<version>``
   3) Activate your virtual environment (optional): ``source <path-to-virt-env>/bin/activate``
   4) Install any extra Python packages (optional): ``pip install --no-cache-dir --no-build-isolation <python-package>``
   5) Start Python or run python script: ``python``

   Installed Python modules (modules and own-installed) can be accessed within Python with ``import <package>`` as usual. 

   The command ``pip list`` given within Python will list the available modules to import. 

   More about packages and virtual/isolated environment to follow in later sections of the course! 


.. keypoints::

   - Before you can run Python scripts or work in a Python shell, first load a python module and prroble prerequisites
   - Start a Python shell session with ``julia`` (note lower case even at HPC2N)
   - Run scripts with ``julia <script.jl>``
    
Running IJulia from Jupyter notebook on UPPMAX 
##############################################

For more interactiveness you can run IJulia.
Like for python it is possible to run a Julia in a notebook, i.e. in a web interface with possibility of inline figures and debugging. An easy way to do this is to load the python module as well. In shell:

$ module load julia/1.7.2
$ module load python/3.9.5
$ julia

In Julia:

.. code-block:: julia

   using IJulia
   notebook(dir="</path/to/work/dir/>")

A Firefox session will start with the Jupyter notebook interface.
