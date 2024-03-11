Isolated environments
=====================

.. tabs::

   .. tab:: Learning objectives

      - remember there are multiple virtual environment managers
      - practice to create, activate, work in and deactive a ``venv``
      - practice to export and import a ``venv``

   .. tab:: For teachers

      Teaching goals are:

      - Learners have heard about Conda
      - Learners have created, activated, worked in and deactived a ``venv``
      - Learners have exported and imported a ``venv``

      Other teaching goals are:

      - Create the ``venv`` called ``vpyenv`` needed later on
      - UPPMAX only: create the ``venv`` called ``Example-gpu`` needed later in this course

      Lesson plan:

      - 5 mins: prior knowledge
         - How to deal with two tools that need incompatible sets of Python packages?
         - How to solve the problem when there are two tools that need incompatible sets of Python packages?
         - What is a virtual environment manager?
         - Which virtual environment managers exists? 
         - What are the differences between virtual environment managers?
      - 5 mins: presentation
      - 25 mins: challenge
      - 5 mins: feedback

Introduction
------------

Different experiments may need different versions of Python and/or Python packages.
Isolated virtual environments (from now on: 'isolated environments')
allow one to work with multiple sets of (potentially incompatible) packages.

Additionally, you may want to have a reproducible computational environment,
so that others can reproduce your computational experiments.
Virtual environments can be exported and imported to provide for better
reproducible computational environments

Environment managers
--------------------

.. mermaid:: isolated.mmd

In this course, we will look at the following environment managers:

+------------+-------------+-------------+------------------+
| Manager    | HPC2N       | UPPMAX      |Scope             |
+============+=============+=============+==================+
| ``conda``  | Avoid       | Recommended |Language agnostic |
+------------+-------------+-------------+------------------+
| ``venv``   | Recommended | OK          |Python only       |
+------------+-------------+-------------+------------------+

In this session, we use an environment manager that works for both UPPMAX
and HPC2N, which is ``venv``.

General workflow
----------------

.. mermaid:: isolated_workflow.mmd

Whatever environment manager you use, this is the workflow:

- You create the isolated environment
- You activate the environment
- You work in the isolated environment. 
  Here you install (or update) the environment with the packages you need
- You deactivate the environment after use 

A virtual environment can be created in multiple ways,
for example, from scratch.
However, there are more efficient ways, which we will use.

In this session, we use ``venv``,
which is a virtual environment manager described in detail
at `the UPPMAX page on 'venv' <http://docs.uppmax.uu.se/software/python_venv/#create-a-virtual-environment>`_.

Exercise 1
----------

In this exercise, we create the course environment ``vpyenv``
in a step-by-step fashion:

.. mermaid:: isolated_workflow_vpyenv.mmd

We create the virtual environment needed for this course, called ``vpyenv``.
As virtual environments can take up a lot of disc space,
we create it in the course project folder.

Step 1: load the modules needed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX
      
      .. code-block:: console

          module load python/3.11.8

   .. tab:: HPC2N
     
      .. code-block:: console

          module load GCC/12.3.0 Python/3.11.3 SciPy-bundle/2023.07 matplotlib/3.7.2

Step 2: create the ``venv``:

.. tabs::

   .. tab:: UPPMAX

      Create the ``venv`` virtual environment called ``vpyenv`` as such:      

      .. code-block:: console

          $ python -m venv --system-site-packages /proj/r-py-jl/[username]/python/vpyenv

      where ``[username]`` is your UPPMAX username, for example ``python -m venv --system-site-packages /proj/r-py-jl/sven/python/vpyenv``.

   .. tab:: HPC2N

      Create the ``venv`` virtual environment called ``vpyenv`` as such:      
     
      .. code-block:: console

          $ python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/[username]/python/vpyenv

      where ``[username]`` is your HPC2N username, for example ``python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/sven/python/vpyenv``.


Step 3: activate the ``venv``:

.. tabs::

   .. tab:: UPPMAX

      Create the ``venv`` virtual environment called ``vpyenv`` as such:      

      .. code-block:: console

          source /proj/r-py-jl/[username]/python/vpyenv/bin/activate

      where ``[username]`` is your UPPMAX username, for example ``python -m venv --system-site-packages /proj/r-py-jl/sven/python/vpyenv``.

   .. tab:: HPC2N

      Create the ``venv`` virtual environment called ``vpyenv`` as such:      
     
      .. code-block:: console

            source /proj/nobackup/hpc2n2024-025/[username]/python/vpyenv/bin/activate

      where ``[username]`` is your HPC2N username, for example ``python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/sven/python/vpyenv``.


Step 4: install packages:

.. tabs::

   .. tab:: UPPMAX

      Install the ``spacy`` and ``seaborn`` packages

      .. code-block:: console

          pip install --user spacy seaborn

   .. tab:: HPC2N

      Install the ``spacy`` and ``seaborn`` packages
     
      .. code-block:: console

          pip install --no-cache-dir --no-build-isolation spacy seaborn 

Step 5: check if the packages are installed

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: console

            pip list

   .. tab:: HPC2N

      .. code-block:: console

            pip list

Step 6: use

We will use this ``venv`` later.

Step 7: deactivate the virtual environments

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: console

            deactivate

   .. tab:: HPC2N

      .. code-block:: console

            deactivate

Well done, you've just created a virtual environment called ``vpyenv``!

**UPPMAX**

Create a virtual environment called ``Example-gpu`` for using on UPPMAX for the numba example and the PyTorch example under GPUs. First load the python version you want to base your virtual environment on (3.9.5 in this example since that is what is on Snowy):

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

         pip install --upgrade numpy scipy numba torch

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
- Create an environment based on dependencies given in an environment file:
  
.. code-block:: console

   $ pip install -r requirements.txt
   
- Create file from present virtual environment:

.. code-block:: console

   $ pip freeze > requirements.txt
  
``requirements.txt`` (used by virtual environment) is a simple
text file which could look like this:

   numpy
   matplotlib
   pandas
   scipy

``requirements.txt`` with versions:

.. code-block:: console

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
   - There are different tools to create virtual environments.
   
      - UPPMAX has Conda and venv and virtualenv
      - HPC2N has venv and virtualenv


Links
---------

* `Video: How to use a Python venv on the Rackham UPPAX cluster (YouTube) <https://youtu.be/OjftEQ23xYk>`_
* `Video: How to use a Python venv on the Rackham UPPAX cluster (.ogv) <https://richelbilderbeek.nl/python_in_venv_hpc.ogv>`_
* `Presentation: How to use a Python venv on the Rackham UPPAX cluster (PDF) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/isolated.pdf>`_
* `Presentation: How to use a Python venv on the Rackham UPPAX cluster (ODP) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/isolated.odp>`_
    

Dead links on purpose
---------------------

- `Dead external links <https://www.abs.ent>`_
- Dead other page :doc:`absent_page.rst`

Notes
-----

module load python_ML_packages/3.9.5-gpu
git clone https://github.com/UPPMAX/R-python-julia-HPC
pip install -r requirements.txt
cd Exercises
pytorch_fitting_gpu.py



module load python/3.10.8

# Create
python -m venv --system-site-packages /proj/naiss2023-22-914/<user>/python/Example

# Activate
source /proj/naiss2023-22-914/<user>/python/Example/bin/activate

# Get requirements
pip freeze > requirements.txt

# Deactivate
deactivate



## Exercise 1


- Create a venv called ‘vpyenv’
- Activate it
- Install the packages ‘spacy’ and ‘seaborn’ using ``pip``
- Confirm that these are installed
- Deactivate the venv


## Exercise 2

- Create a venv called ‘vpyenv’
- Activate it
- Create a file ‘requirements.txt’ with content:
numpy==1.22.3
matplotlib==3.5.2
pandas==1.4.2
- Install these requirements
- Confirm that these are installed
- Deactivate the venv



.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environments.
      - UPPMAX has  Conda and venv and virtualenv
      - HPC2N has venv and virtualenv.
      - More details in the separated sessions!
