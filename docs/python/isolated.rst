Isolated environments
=====================

.. note::

   Isolated environments solve a couple of problems:
   
   - You can install specific, also older, versions into them.
   - You can create one for each project and no problem if the two projects require different versions.
   - You can remove the environment and create a new one, if not needed or with errors.
   
``conda`` works as an isolated environment. 
Below we present the ``pip`` way with "virtual environments", 
as well as installing using ``setup.py``.
Installing with a virtual environment is the only recommended way at HPC2N! 

.. objectives:: Teaching objectives

   - learners have created, activated, used and deactivated a venv
   - learners have used an ML package
   - learners have heard about conda

Overview
--------

+-----------------------+-------------------+------------------+
| Parameter             | conda             | venv             |
+=======================+===================+==================+
| Scope                 | Language agnostic | Python-exclusive |
| UPPMAX recommendation | Recommended       | OK               |
| HPC2N recommendation  | Avoid             | Recommended      |
+-----------------------+-------------------+------------------+


General procedures   
------------------

You will often have the situation that your project(s) use different versions of Python and different versions of packages. This is great if you need different versions of a package for different tasks, for instance.

As an example, maybe you have been using TensorFlow 1.x.x for your project and now you need to install a package that requires TensorFlow 2.x.x but you will still be needing the old version of TensorFlow for another package, for instance. This is easily solved with isolated environments.

- Isolated environments lets you create separate workspaces for different versions of Python and/or different versions of packages. 
- You can activate and deactivate them one at a time, and work as if the other workspace does not exist.

There are different tools for creating an isolated environement, but they all have some things in common. At both UPPMAX and HPC2N the workflow is: 

- You load the Python module you will be using, as well as any site-installed package modules (requires the ``--system-site-packages`` option)
- You create the isolated environment with something like venv, virtualenv, or conda
- You activate the environment
- You install (or update) the environment with the packages you need
- You work in the isolated environment
- You deactivate the environment after use 

**The tools**

In this course we will look at the following tools for creating and using isolated environments: 

   - venv            UPPMAX+HPC2N
   - virtualenv      UPPMAX+HPC2N
   - Conda           UPPMAX


.. admonition:: venv vs. virtualenv

   - These are almost completely interchangeable
   - The difference being that **virtualenv supports older python versions** and has a few more minor unique features, while **venv is in the standard library**.

.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environemnts.
      - UPPMAX has  Conda and venv and virtualenv
      - HPC2N has venv and virtualenv.
      - More details in the separated sessions!
 
   
Virtual environment - venv & virtualenv
---------------------------------------

Example
'''''''

.. tip::
    
   **Do not code along!**

Create a ``venv``. First load the python version you want to base your virtual environment on (3.11.x for this course):

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: console

         $ module load python/3.11.8
         $ python -m venv --system-site-packages Example
    
      "Example" is the name of the virtual environment. The directory “Example” is created in the present working directory. The ``-m`` flag makes sure that you use the libraries from the python version you are using.

   .. tab:: HPC2N

      .. code-block:: console

         $ module load GCC/12.3.0 Python/3.11.3
         $ virtualenv --system-site-packages Example
    
      Where "Example" is the name of the virtual environment. You can name it whatever you want. The directory “Example” is created in the present working directory - to change that, give the full path.


.. note::

   To save space, you should load any other Python modules you will need that are system installed before installing your own packages! Remember to choose ones that are compatible with the Python version you picked! 
   ``--system-site-packages`` includes the packages already installed in the loaded python module.

**NOTE**: since it may take up a bit of space if you are installing many Python packages to your virtual environment, we **strongly** recommend you place it in your project storage! 

**NOTE**: if you need are for instance working with both Python 2 and 3, then you can of course create more than one virtual environment, just name them so you can easily remember which one has what. 
      

If you want it in a certain place...

.. tabs::

   .. tab:: UPPMAX

      To place it in (your own subdirectory named <user>/python) in the course project folder
      
      .. code-block:: console

         $ python -m venv --system-site-packages /proj/r-py-jl/<user>/python/Example
    
      Activate it.

      .. code-block:: console

          $ source /proj/r-py-jl/<user>/python/Example/bin/activate

      Note that your prompt is changing to start with (Example) to show that you are within an environment.

   .. tab:: HPC2N

      To place it in a directory you created below your project storage (again calling it "Example"): 

      .. code-block:: console

         $ virtualenv --system-site-packages /proj/nobackup/hpc2n2024-025/<your-directory>/python/Example 
    
      Activate it.

      .. code-block:: console

          $ source /proj/nobackup/hpc2n2024-025/<your-directory>/python/Example/bin/activate


Note that your prompt is changing to start with (name of your vitual environment) to show that you are within it.


Using pip
---------

Install your packages (here numpy and matplotlib, both with specific versions) with ``pip``. While not always needed, it is often a good idea to give the correct versions you want, to ensure compatibility with other packages you use: 

.. prompt:: 
    :language: bash
    :prompts: (Example) $
      
    pip install numpy==1.15.4 matplotlib==2.2.2

Deactivate it.

.. code-block:: console
  
   deactivate
    
The "--no-cache-dir" option is required to avoid it from reusing earlier installations from the same user in a different environment. The "--no-build-isolation" is to make sure that it uses the loaded modules from the module system when building any Cython libraries.


Everytime you need the tools available in the virtual environment you activate it as above.

.. code-block:: console

   $ source /proj/nobackup/hpc2n2024-025/<your-directory>/python/Example/bin/activate
    

Prepare the course environment
------------------------------

.. tip::
    
   **Code along!**


Create a virtual environment called ``vpyenv``. First load the python version you want to base your virtual environment on:

.. tabs::

   .. tab:: UPPMAX
      
      .. code-block:: console

          $ module load python/3.11.8
          $ python -m venv --system-site-packages /proj/r-py-jl/<user>/python/vpyenv
    
      Activate it.

      .. code-block:: console

         $ source /proj/r-py-jl/<user>/python/vpyenv/bin/activate

      Note that your prompt is changing to start with (vpyenve) to show that you are within an environment.

      Install your packages with ``pip`` (``--user`` not needed) and the correct versions, like:

      .. prompt:: 
         :language: bash
         :prompts: (vpyenv) $

         pip install spacy seaborn

      Check what was installed

      .. prompt:: 
         :language: bash
         :prompts: (vpyenv) $

         pip list

      Deactivate it.

      .. prompt:: 
         :language: bash
         :prompts: (vpyenv) $

         deactivate

      Everytime you need the tools available in the virtual environment you activate it as above.

      .. code-block:: console

         $ source /proj/r-py-jl/<user>/python/vpyenv/bin/activate

      More on virtual environment: https://docs.python.org/3/tutorial/venv.html 
      
   .. tab:: HPC2N
     
      Installing spacy, seaborn. Using existing modules for numpy (in SciPy-bundle), matplotlib, under Python 3.11.3.    

      .. admonition:: Load modules for Python, numpy (in SciPy-bundle), matplotlib, activate the environment, create virtualenv "vpyenv", activate the environment, and install spacy and seaborn on Kebnekaise at HPC2N. 
         :class: dropdown
   
         .. code-block:: sh
           
            b-an01 [/proj/nobackup/hpc2n2024-025/bbrydsoe/python]$ module load GCC/12.3.0 Python/3.11.3 SciPy-bundle/2023.07 matplotlib/3.7.2
	    b-an01 [/proj/nobackup/hpc2n2024-025/bbrydsoe/python]$ virtualenv --system-site-packages vpyenv
            b-an01 [/proj/nobackup/hpc2n2024-025/bbrydsoe/python]$ source vpyenv/bin/activate
            (vpyenv) $ pip install --no-cache-dir --no-build-isolation spacy seaborn 

         Deactivating a virtual environment.

         .. code-block:: sh

            (vpyenv) $ deactivate

      Every time you need the tools available in the virtual environment you activate it as above (after first loading the modules for Python, Python packages, and prerequisites)

      .. code-block:: console

         $ source vpyenv/bin/activate


**UPPMAX**

Create a virtual environment called ``Example-gpu`` for using on UPPMAX for the numba example under GPUs. First load the python version you want to base your virtual environment on (3.9.5 in this example since that is what is on Snowy):

      .. code-block:: console

          $ module load python/3.9.5
          $ python -m venv --system-site-packages /proj/r-py-jl/<user>/python/Example-gpu
    
      Activate it.

      .. code-block:: console

         $ source /proj/r-py-jl/<user>/python/Example-gpu/bin/activate

      Note that your prompt is changing to start with (Example-gpu) to show that you are within an environment.

      Install your packages with ``pip`` (``--user`` not needed) and the correct versions, like:

      .. prompt:: 
         :language: bash
         :prompts: (Example-gpu) $

         pip install --upgrade numpy scipy numba

      Check what was installed

      .. prompt:: 
         :language: bash
         :prompts: (vpyenv) $

         pip list

      Deactivate it.

      .. prompt:: 
         :language: bash
         :prompts: (Example-gpu) $

         deactivate

      Everytime you need the tools available in the virtual environment you activate it as above.

      .. code-block:: console

         $ source /proj/r-py-jl/<user>/python/Example-gpu/bin/activate

      
    
Using setup.py
--------------

Some Python packages are only available as downloads, for instance via github, to install with setup.py or similar file. If that is the case for the package you need, this is how you do it: 

- Pick a location for your installation (change below to fit - I am installing under a project storage)

   - ``mkdir /proj/<project>/<mystorage>/mypythonpackages``
   - ``cd /proj/<project>/<mystorage>/mypythonpackages``
   
- Load Python + (on Kebnekaise) site-installed prerequisites (SciPy-bundle, matplotlib, etc.)
- Install any remaining prerequisites. Remember to activate your Virtualenv if installing with pip!
- Download Python package, place it in your chosen installation dir, then untar/unzip it
- cd into the source directory of the Python package

   - Run ``python setup.py build``
   - Then install with: ``python setup.py install --prefix=<path to install dir>``
   
- Add the path to $HOME/.bash_profile (note that it will differ by Python version): 

   - ``export PYTHONPATH=$PYTHONPATH:<path to your install directory>/lib/python3.11/site-packages``
   
You can use it as normal inside Python (remember to load dependent modules as well as activate virtual environment if it depends on some packages you installed with pip): ``import <python-module>``


Using the self-installed packages in Python
-------------------------------------------

- To use the Python packages you have installed under your virtual environment, load your Python module + prerequisites, load any site-installed Python packages you used, and then activate the environment.
- Now your own packages can be accessed from within Python, just like any other Python package. 

**Test it!**

.. tip::
    
   **Code along!**


Using the virtual environment created earlier and the ``spacy`` we installed under the code-along example above. 

.. admonition:: UPPMAX: Load modules for Python, activate the environment 
   :class: dropdown
   
   .. code-block:: console
           
      $ module load python/3.11.8
      $ source /proj/r-py-jl/<user>/python/vpyenv/bin/activate
      (vpyenv) $ python
      Python 3.11.8 (main, Feb  8 2024, 11:48:52) [GCC 12.3.0] on linux
      Type "help", "copyright", "credits" or "license" for more information.
      >>> import spacy
      >>> 


.. admonition:: HPC2N: Load modules for Python, numpy (in SciPy-bundle), activate the environment "vpyenv". 
    :class: dropdown
   
        .. code-block:: sh
           
           b-an01 [/proj/nobackup/hpc2n2024-025/bbrydsoe/python]$ module load GCC/12.3.0 Python/3.11.3 SciPy-bundle/2023.07
           b-an01 [/proj/nobackup/hpc2n2024-025/bbrydsoe/python]$ source vpyenv/bin/activate
           (vpyenv) b-an01 [/proj/nobackup/hpc2n2024-025/bbrydsoe/python]$ python
           Python 3.11.3 (main, Oct 30 2023, 16:00:15) [GCC 12.3.0] on linux
           Type "help", "copyright", "credits" or "license" for more information.
           >>> import spacy
           >>> 

        Try and do the same for seaborn.  

- To use self-installed Python packages in a batch script, you always also need to load the above mentioned modules and activate the environment. An example of this will follow later in the course. 

- To see which Python packages you, yourself, have installed, you can use ``pip list --user`` while the environment you have installed the packages in are active. 


Working with virtual environments defined from files
----------------------------------------------------

- First create and activate an environment (see above)
- Create an environment based on dependencies given in an environment file::
  
.. code-block:: console

   $ pip install -r requirements.txt
   
- Create file from present virtual environment::

.. code-block:: console

   $ pip freeze > requirements.txt
  
``requirements.txt`` (used by virtual environment) is a simple
text file which could look like this::

   numpy
   matplotlib
   pandas
   scipy

``requirements.txt`` with versions::

    numpy==1.18.1
    matplotlib==3.1.3
    pandas==1.1.2
    scipy==1.6.2

.. admonition:: More on dependencies

   - `Dependency management from coursePython for Scientific computing <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_


.. note:: 

   **pyenv**

   - This approach is more advanced and should be, in our opinion, used only if the above are not enough for the purpose. 
   - ``pyenv`` allows you to install your **own python version**, like 3.10.2, and much more… 
   - Probably Conda will work well for you.
   - https://www.uppmax.uu.se/support/user-guides/python-user-guide/#tocjump_9931546434791352_12


More info
---------

- UPPMAX's documentation pages about installing Python packages and virtual environments: https://www.uppmax.uu.se/support/user-guides/python-user-guide/
- HPC2N's documentation pages about installing Python packages and virtual environments: https://www.hpc2n.umu.se/resources/software/user_installed/python

.. admonition:: Summary of workflow

   In addition to loading Python, you will also often need to load site-installed modules for Python packages, or use own-installed Python packages. The work-flow would be something like this: 
   
 
   1) Load Python and prerequisites: `module load <pre-reqs> Python/<version>``
   2) Load site-installed Python packages (optional): ``module load <pre-reqs> <python-package>/<version>``
   3) Activate your virtual environment (optional): ``source <path-to-virt-env>/bin/activate``
   4) Install any extra Python packages (optional): ``pip install --no-cache-dir --no-build-isolation <python-package>``
   5) Start Python or run python script: ``python``
   6) Do your work
   7) Deactivate

   - Installed Python modules (modules and own-installed) can be accessed within Python with ``import <package>`` as usual. 
   - The command ``pip list`` given within Python will list the available modules to import. 
   - More about packages and virtual/isolated environment to follow in later sections of the course! 

Exercises
---------

.. admonition:: For teachers

    - Technical: Use ``python/3.11.8`` and ``python_ML_packages/3.11.8-GPU``
    - Teaching goals: 
        - learners have created, activated, used and deactivated a conda virtual environment
        - learners have used an ML package
        - learners have heard about venv

.. challenge:: Create a virtual environment with a requirements file below

   - Create a virtual environment with Python 3.11.x with the name ``analysis``.
   - Install packages defined by a ``requirements.txt`` file (save it).
  
   .. code-block:: sh
   
      numpy==1.22.3
      matplotlib==3.5.2
      pandas==1.4.2
    
   - Check that the packages were installed
   - Deactivate the virtual environment

.. solution:: Solution for UPPMAX
    :class: dropdown
    
     .. code-block:: console

          $ module load python/3.11.8
          $ python -m venv --system-site-packages /proj/r-py-jl/<user>/python/analysis
    
      Activate it.

      .. code-block:: console

         $ source /proj/r-py-jl/<user>/python/analysis/bin/activate

      - Note that your prompt is changing to start with (analysis) to show that you are within an environment.
      - Install the packages from the file::
      
      .. code-block:: console

         (analysis) $ pip install -r requirements.txt
      
      - check the installation
      
       .. code-block:: sh

         (analysis) $ pip list
	 (analysis) $ deactivate
      
.. solution:: Solution for HPC2N
    :class: dropdown
    
     .. code-block:: console

          $ module load GCC/12.3.0 Python/3.11.3 
          $ virtualenv --system-site-packages /proj/nobackup/hpc2n2024-025/<user-dir>/python/analysis 

     Activate it.

     .. code-block:: console

        $ source /proj/nobackup/hpc2n2024-025/<user-dir>/python/analysis/bin/activate

     - Note that your prompt is changing to start with (analysis) to show that you are within an environment.
     - Install the packages from the file::
      
     .. code-block:: console

	(analysis) $ pip install -r requirements.txt

     Check that the packages were installed and then deactivate the virtual environment
      
     .. code-block:: console

        $ pip list
        $ deactivate
      
     You could also have started Python and tried to import the package instead of using "pip list".


.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environemnts.
   
      - UPPMAX has Conda and venv and virtualenv
      - HPC2N has venv and virtualenv


Links
---------

* `Video: How to use a Python venv on the Rackham UPPAX cluster (YouTube) <https://youtu.be/OjftEQ23xYk>`_
* `Video: How to use a Python venv on the Rackham UPPAX cluster (.ogv) <https://richelbilderbeek.nl/python_in_venv_hpc.ogv>`_
* `Presentation: How to use a Python venv on the Rackham UPPAX cluster (PDF) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/isolated.pdf>`_
* `Presentation: How to use a Python venv on the Rackham UPPAX cluster (ODP) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/isolated.odp>`_
    

Notes
-----

module load python_ML_packages/3.9.5-gpu
git clone https://github.com/UPPMAX/R-python-julia-HPC
pip install -r requirements.txt
cd Exercises
pytorch_fitting_gpu.py
