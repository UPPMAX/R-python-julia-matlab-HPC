Packages
========

.. admonition::  Julia modules AKA Julia packages

   - Julia **packages broaden the use of Julia** to almost infinity! 

   - Instead of writing code yourself there may be others that have done the same!

.. questions::

   - How do I find which packages and versions are available?
   - What to do if I need other packages?
   - Are there differences between HPC2N and UPPMAX?
   
.. objectives:: 

   - Show how to check for Julia packages
   - show how to install own packages on the different clusters


Check current available packages
--------------------------------

General for both centers
########################

.. tabs::

   .. tab:: UPPMAX

	Check the pre-installed packages of a specific python module:

	.. code-block:: sh 

	   $ module help julia/<version> 
  
	
	
   .. tab:: HPC2N
      
Check the pre-installed packages of a loaded julia module, in shell:

UPPMAX
######

You may control the present "central library" by typing in julia shell :

.. code-block:: julia 

   using Pkg
   Pkg.activate(DEPOT_PATH[2]*"/environments/v1.7");     #change version accordingly
   Pkg.status()
   Pkg.activate(DEPOT_PATH[1]*"/environments/v1.7");     #to return to user library

Packages are imported or loaded by the commands ``import`` and ``using``, respectively. The difference is shown here. Or briefly:

    To use module functions, use import Module to import the module, and Module.fn(x) to use the functions.
    Alternatively, using Module will import all exported Module functions into the current namespace.

A selection of the Julia packages and libraries installed on UPPMAX and HPC2N are:

.. tabs::

   .. tab:: UPPMAX

	The python application at UPPMAX comes with several preinstalled packages.
	A selection of the Python packages and libraries installed on UPPMAX are:

          - BenchmarkTools
          - CSV
          - CUDA
          - MPI
          - Distributed
          - IJulia
          - Plots
          - PyPlot
          - Gadfly
          - DataFrames
          - DistributedArrays
          - PlotlyJS

   .. tab:: HPC2N


HOW TO INSTALL PERSONAL PACKAGES
================================

To make sure that the package is not already installed, type in Julia:

.. code-block:: julia 

   using Pkg
   Pkg.activate(DEPOT_PATH[2]*"/environments/v1.7");  #change version accordingly

   Pkg.status()

To go back to your own personal packages:

.. code-block:: julia 
     
   Pkg.activate(DEPOT_PATH[1]*"/environments/v1.7");
   Pkg.status()

You can load (using/import) ANY package from both local and central installation irrespective to which environment you activate. However, the setup is that your package is prioritized if there are similar names.

To install personal packages you type within Julia:

.. code-block:: julia 
     
   Pkg.add("<package_name>")

This will install under the path ~/.julia/packages/. Then you can load it by just doing "using/import <package_name>".

.. code-block:: julia 
     
   using <package_name>

You can also activate a "package prompt" in julia with   ']':

.. code-block:: julia 
     
   (@v1.7) pkg> add <package name>

For installing specific versions specify with  <package name>@<X.Y.Z>.

After adding you may be asked to precompile or build. Do so according to instruction given on the screen. Otherwise, first time importing or using the package, Julia may start a precompilation that will take a few seconds up to several minutes.

Exit "package prompt" with <backspace>:

.. code-block:: julia 

   julia> 

.. note::
   
   You will test this in the separated sessions about isolated environments in a while.

.. keypoints::

   - You can check for packages 
   	- from the Python shell with the ``import`` command
	- from BASH shell with the 
		- ``pip list`` command at both centers
		- ``ml help python/3.9.5`` at UPPMAX
   - Installation of Python packages can be done either with **PYPI** or **Conda**
   - You install own packages with the ``pip install`` command (This is the recommended way on HPC2N)
   - At UPPMAX Conda is also available (See Conda section)
