********
Packages
********

.. tabs::

   .. tab:: Learning objectives


      - Have a first 'Get stuff to work' experience
      - Rehearse creating a script
      - Experience when importing a Python package gives an error
      - Search for an UPPMAX module that needs to be loaded
      - Import a Python package successfully

   .. tab:: For teachers

      Teaching goals are:

      - Learners have observed the error when importing a Python package without the needed UPPMAX module loaded
      - Learners have search through the UPPMAX modules
      - Learners may find out that X-forwarding is important
      - Learners have gotten 'stuff to work'

      Other goals are:

      - Verify that learners indeed have learned how to login with X-forwarding.
        Redirect to remote desktop environment as a solution

      Lesson plan:

      - 5 mins: prior knowledge
      - 5 mins: presentation
      - 25 mins: challenge
      - 5 mins: feedback

############
Introduction
############

Packages are pieces of Python code written to be used by others.
When possible, using an existing Python package is usually smarter than writing code yourself.
In this session, 
we practice working with packages.

***********************************
Python package installation systems
***********************************

There are two Python package installation system.
In this session, we use `pip`, as it can be used on both HPC clusters.

+-----------------------------+-------------+-------------+
| Package installation system | HPC2N       | UPPMAX      |
+=============================+=============+=============+
| conda                       | Unsupported | Recommended |
+-----------------------------+-------------+-------------+
| pip                         | Recommended | Supported   |
+-----------------------------+-------------+-------------+

- `HPC2N guide against using conda <https://www.hpc2n.umu.se/documentation/guides/anaconda>`_

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
   
   - List packages in present environment:    ``conda list``
   - List all environments:            ``conda info -e`` or ``conda env list``
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

#########
Questions
#########

We ask questions

**********
Exercise 1
**********

.. admonition:: Teaching goals

    Apply the documentation to show if a Python package is already installed

.. tabs::

    .. tab:: Exercise 1.1

        Load the module for Python 3.11.4

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            module load python/3.11.4

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            module load python/3.11.4

.. tabs::

    .. tab:: Exercise 1.2

        Is the Python package `pandas` installed? If yes, which version?

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            pip list

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            pip list

        Then among the list one can find: ``pandas 2.0.3``

        So, yes, the Python package `pandas` version 2.0.3 is installed!

.. tabs::

    .. tab:: Exercise 1.3

        Is the Python package `mhcnuggets` installed? If yes, which version?

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            pip list

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            pip list

        In the list, one cannot find ``mhcnuggets``.

        So, no, the Python package ``mhcnuggets`` is not installed.


**********
Exercise 2
**********

.. admonition:: Teaching goals

   	 Apply the documentation to load a Python package

The Python package PyTorch is not installed.

- Use the module system to find which module you need to load.
- Load the TensorFlow module.
- Confirm that it works

**********
Question 3
**********

.. admonition:: Teaching goals

    Apply the documentation to install a Python package

The Python package Theano is not installed.
Install Theano.

  
#####
Links
#####

* `Introduction to Python packages <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_
* `Video: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (YouTube) <https://youtu.be/novRJfAa2QA>`_
* `Video: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (.ogv) <https://richelbilderbeek.nl/use_python_packages_hpc_from_txt.ogv>`_
* `Presentation: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (PDF) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/find_and_use_packages.pdf>`_
* `Presentation: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (ODP) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/find_and_use_packages.odp>`_
    
    
