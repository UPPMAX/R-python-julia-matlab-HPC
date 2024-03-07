Packages
========

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


Introduction
------------

Packages are pieces of Python code written to be used by others.
When possible, using an existing Python package is usually smarter than writing code yourself.
In this session, 
we practice working with packages.

Python package installation systems
-----------------------------------

There are two Python package installation systems,
called ``conda`` and ``pip``.

In this session, we use ``pip``, as it can be used on 
the two HPC clusters used in this course:

+-----------------------------+-----------------+------------------+-----------------+
| Package installation system | HPC2N           | UPPMAX (Rackham) | UPPMAX (Bianca) |
+=============================+=================+==================+=================+
| conda                       | Unsupported [1] | Recommended      | Recommended     |
+-----------------------------+-----------------+------------------+-----------------+
| pip                         | Recommended     | Supported        | Unsupported [2] |
+-----------------------------+-----------------+------------------+-----------------+

- ``[1]`` `HPC2N guide against using conda <https://www.hpc2n.umu.se/documentation/guides/anaconda>`_
- ``[2]`` Bianca has no internet

In this session we use ``pip``, 
because it is a commonly-used package installation system
that works on both HPC clusters used in this course.
For UPPMAX users, we will discuss Conda in the session 
`Conda at UPPMAX <https://uppmax.github.io/R-python-julia-HPC/python/condaUPPMAX.html>`_.

As a first impression, here is a simple comparison between the two:

+------------------------------+-------+------+
| Parameter                    | conda | pip  |
+==============================+=======+======+
| Installs Python packages     | Yes   | Yes  |
+------------------------------+-------+------+
| Installs non-Python software | Yes   | No   |
+------------------------------+-------+------+


Install with pip
----------------

You use ``pip`` this way, in a Linux shell OR a python shell: 

.. code-block:: console 

    $ pip install --user <package>
    
Use ``pip3`` if you loaded python3.

Then (on your own computer) the package ends up 
in ``~/.local/lib/python<version>/site-packages/``.

Note that ``python<version>`` is omitting the third number in the version, 
hence ``python-3.9.6`` will be stored in ``~/.local/lib/python-3.9``.
We HIGHLY recommend using a virtual environment during installation, 
since this makes it easier to install for different versions of Python,
as is taught in `the session on isolated environments <https://uppmax.github.io/HPC-python/isolated.html>`_

.. note::
   
   You will test this in the next session about isolated environments.

.. keypoints::

   - You can check for packages 
   
       - from the Python shell with the ``import`` command
    - from BASH shell with the 
    
        - ``pip list`` command at both centers
        - ``module help python/3.10.8`` at UPPMAX
        
   - Installation of Python packages can be done either with **PYPI** or **Conda**
   - You install own packages with the ``pip install`` command (This is the recommended way on HPC2N)
   - At UPPMAX Conda is also available (See Conda section)

Exercises
---------

Here are some exercises, including the answers.

Exercise 1
----------

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


Exercise 2
----------

.. admonition:: Teaching goals

   	 Apply the documentation to load a Python package

The Python package PyTorch is not installed.

- Use the module system to find which module you need to load.
- Load the TensorFlow module.
- Confirm that it works

Question 3
----------

.. admonition:: Teaching goals

    Apply the documentation to install a Python package

The Python package Theano is not installed.
Install Theano.

  
Links
-----

* `Introduction to Python packages <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_
* `Video: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (YouTube) <https://youtu.be/novRJfAa2QA>`_
* `Video: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (.ogv) <https://richelbilderbeek.nl/use_python_packages_hpc_from_txt.ogv>`_
* `Presentation: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (PDF) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/find_and_use_packages.pdf>`_
* `Presentation: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (ODP) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/find_and_use_packages.odp>`_
    
    
