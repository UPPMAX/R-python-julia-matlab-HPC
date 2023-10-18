Packages
========

.. admonition:: Python modules AKA Python packages

   - Python **packages broaden the use of python** to almost infinity! 

   - Instead of writing code yourself there may be others that have done the same!

   - Many **scientific tools** are distributed as **python packages**, making it possible to run a script in the prompt and there define files to be analysed and arguments defining exactly what to do.

   - A nice **introduction to packages** can be found here: https://aaltoscicomp.github.io/python-for-scicomp/dependencies/ 

.. questions::

   - How do I find which packages and versions are available?
   - What to do if I need other packages?
   - Are there differences between HPC2N and UPPMAX?
   
.. objectives:: 

   - Show how to check for Python packages
   - show how to install own packages on the different clusters


.. admonition:: There are two package installation systems

    - **PyPI** (``pip``) is traditionally for Python-only packages but it is no problem to also distribute packages written in other languages as long as they provide a Python interface.

    - **Conda** (``conda``) is more general and while it contains many Python packages and packages with a Python interface, it is often used to also distribute packages which do not contain any Python (e.g. C or C++ packages).

        - Creates its own environment that does not interact with other python installations
	- At HPC2N, Conda is not recommended, and we do not support it there

    - Many libraries and tools are distributed in both ecosystems.


Check current available packages
--------------------------------

General for both centers
########################

Some python packages are working as stand-alone tools, for instance in bioinformatics. The tool may be already installed as a module. Check if it is there by:

.. code-block:: console 

   $ module spider <tool-name or tool-name part> 
    
Using ``module spider`` lets you search regardless of upper- or lowercase characters.



.. tabs::

   .. tab:: UPPMAX

	Check the pre-installed packages of a specific python module:

	.. code-block:: console 

	   $ module help python/<version> 
  
	
	
   .. tab:: HPC2N
   
	At HPC2N, a way to find Python packages that you are unsure how are names, would be to do

	.. code-block:: console 

	   $ module -r spider ’.*Python.*’
   
	or

	.. code-block:: console 

	   $ module -r spider ’.*python.*’
   
	Do be aware that the output of this will not just be Python packages, some will just be programs that are compiled with Python, so you need to check the list carefully.   
   
Check the pre-installed packages of a loaded python module, in shell:

.. code-block:: console 

   $ pip list

To see which Python packages you, yourself, has installed, you can use ``pip list --user`` while the environment you have installed the packages in are active.

You can also test from within python to make sure that the package is not already installed:

.. code-block:: python 

    >>> import <package>
    
Does it work? Then it is there!
Otherwise, you can either use ``pip`` or ``conda``.


**NOTE**: at HPC2N, the available Python packages needs to be loaded as modules before using! See a list of some of them below or find more as mentioned above, using ``module spider -r ....```

A selection of the Python packages and libraries installed on UPPMAX and HPC2N are:

.. tabs::

   .. tab:: UPPMAX

	The python application at UPPMAX comes with several preinstalled packages.
	A selection of the Python packages and libraries installed on UPPMAX are:

	  - ``Numpy``
	  - ``Pandas``
 	  - ``Scipy``
	  - ``Matplotlib``
	  - ``Jupyter notebook``
	  - ``pip``
	  - ``cython``
	  - ``ipython``
	  - ``networkx``
	  - ``graphviz/0.16``
	In addition there are packages available from the module system
  	  - ``biopython``
  	  - ``python_ML_packages``
    	  - ``sklearn/scikit-learn``
	  - ``TensorFlow`` 
	  - ``torch``
    	  - ``mpi``
    	  - ``mpi4py``
  	  - ``bwa``
  	  - ``Graphviz/2.40.1``
  	  - ``HiChipper``
  	  - ``Homer``
  	  - ``pysam``

   .. tab:: HPC2N

      - The python application at HPC2N comes with several preinstalled packages - check first before installing yourself!. 
      - HPC2N has both Python 2.7.x and Python 3.x installed. 
      - We will be using Python 3.x in this course.  For this course, the recommended version of Python to use on Kebnekaise is 3.10.4

	NOTE:  HPC2N do NOT recommend (and do not support) using Anaconda/Conda on our systems. You can read more about this here: https://www.hpc2n.umu.se/documentation/guides/anaconda


      - This is a selection of the packages and libraries installed at HPC2N. These are all installed as **modules** and need to be loaded before use. Some may also have **prerequisites** that needs to be loaded first. That will be listed when you check with module spider <package-module> 
	
	  - ``ASE``  (Not on AMD nodes yet)
	  - ``Keras``
	  - ``PyTorch``   
	  - ``SciPy-bundle`` (Bottleneck, deap, mpi4py, mpmath, numexpr, numpy, pandas, scipy - some of the versions have more)
	  - ``TensorFlow``
	  - ``Theano``  (Not on AMD nodes yet)
	  - ``matplotlib`` 
	  - ``scikit-learn`` 
	  - ``scikit-image``  (Not on AMD nodes yet)
	  - ``pip``  
	  - ``iPython``  (Not on AMD nodes yet)
	  - ``Cython``   
	  - ``Flask``   (Not on AMD nodes yet)



Install with pip
----------------

You use ``pip`` this way, in a Linux shell OR a python shell: 

.. code-block:: console 

    $ pip install --user <package>
    
Use ``pip3`` if you loaded python3.

Then (on your own computer) the package ends up in ``~/.local/lib/python<version>/site-packages/`` .

Note that python<version> is omitting the last number (bug fix), like 3.9 for python-3.9.6.
We HIGHLY recommend using a virtual environment during installation, since this makes it easier to install for different versions of Python.  More information will follow later in this course (https://uppmax.github.io/HPC-python/isolated.html). 



.. note::
   
   You will test this in the next session about isolated environments.

.. keypoints::

   - You can check for packages 
   
   	- from the Python shell with the ``import`` command
	- from BASH shell with the 
	
		- ``pip list`` command at both centers
		- ``ml help python/3.10.8`` at UPPMAX
		
   - Installation of Python packages can be done either with **PYPI** or **Conda**
   - You install own packages with the ``pip install`` command (This is the recommended way on HPC2N)
   - At UPPMAX Conda is also available (See Conda section)

Conda
-----

.. questions::

   - What does Conda do?
   - How to create a Conda environment
   
.. objectives::

   - Learn pros and cons with Conda
   - Learn how to install packages and work with the Conda (isolated) environment
   
.. hint::

   - On Bianca (with no internet), Conda is the first choice when installing packages, because there is a local mirror of most of the Conda repositories.

Using Conda
###########
      
.. admonition:: Conda cheat sheet    
   
   - List packages in present environment:	``conda list``
   - List all environments:			``conda info -e`` or ``conda env list``
   - Install a package: ``conda install somepackage``
   - Install from certain channel (conda-forge): ``conda install -c conda-forge somepackage``
   - Install a specific version: ``conda install somepackage=1.2.3``
   - Create a new environment: ``conda create --name myenvironment``
   - Create a new environment from requirements.txt: ``conda create --name myenvironment --file requirements.txt``
   - On e.g. HPC systems where you don’t have write access to central installation directory: conda create --prefix /some/path/to/env``
   - Activate a specific environment: ``conda activate myenvironment``
   - Deactivate current environment: ``conda deactivate``

.. note::

   Learn how the install with Conda on UPPMAX in the session `Conda at UPPMAX <https://uppmax.github.io/R-python-julia-HPC/python/condaUPPMAX.html>`_ 

  
Links
---------

* `Video: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (YouTube) <https://youtu.be/novRJfAa2QA>`_
* `Video: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (.ogv) <https://richelbilderbeek.nl/use_python_packages_hpc_from_txt.ogv>`_
* `Presentation: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (PDF) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/find_and_use_packages.pdf>`_
* `Presentation: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (ODP) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/find_and_use_packages.odp>`_
    
    
