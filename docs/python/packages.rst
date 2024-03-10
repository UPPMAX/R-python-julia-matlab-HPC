Packages
========

.. tabs::

   .. tab:: Learning objectives

      - practice to determine the version of a Python package 
      - practice to determine that a Python package is not installed
      - practice to have loaded a Python machine learning module
      - practice to install a Python package

   .. tab:: For teachers

      Teaching goals are:

      - Learners have determined the version of a Python package 
      - Learners have determined that a Python package is not installed
      - Learners have loaded a Python machine learning module
      - Learners have installed a Python package

      Lesson plan:

      - 5 mins: prior knowledge
        - What are Python packages?
        - Why use Python packages?
        - How to find out if a package is already installed?
        - What are some Python package installers?
        - What are the differences?
        - What are some Python package installers used on UPPMAX?
        - What are some Python package installers used on HPC2N?
      - 5 mins: presentation
      - 25 mins: challenge
      - 5 mins: feedback


Introduction
------------

Packages are pieces of Python code written to be used by others.
When possible, using an existing Python package is usually smarter than writing code yourself.
In this session, 
we practice working with packages.

.. mermaid:: packages.mmd

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

These exercises follow a common user journey, 
for a user that needs to use a certain Python packages:

- In exercise 1, we determine if a Python package is already installed
- In exercise 2, we determine if a machine learning Python package is already installed
- If all fails, in exercise 3, we install a Python package ourselves

Like any user, we'll try to be autonomous and read the -hopefully well written!-
UPPMAX documentation.

Exercise 1
----------

.. admonition:: Teaching goals

    - Practice reading documentation
    - Apply/rehearse the documentation to load a module
    - Apply the documentation to show if a Python package is already installed
    - Observe how it looks like when a package is not installed

Imagine you want to use the Python packages `pandas` and `tensorflow-cpu` and `mhcnuggets`.
Here we see that one comes already installed with the module system.

.. tabs::

    .. tab:: Exercise 1.1

        Read [the UPPMAX documentation on how to load Python](http://docs.uppmax.uu.se/software/python/#loading-python).

        Load the module for Python 3.11.8

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            module load python/3.11.8

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            module load python/3.11.8

.. tabs::

    .. tab:: Exercise 1.2

        Read [the UPPMAX documentation on how to determine if a Python package comes with your Python module](http://docs.uppmax.uu.se/software/python/#determine-if-a-python-package-comes-with-your-python-module).

        Is the Python package `pandas` installed? If yes, which version?

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            pip list

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            pip list

        Then among the list one can find: ``pandas 2.2.0``

        So, yes, the Python package `pandas` version 2.2.0 is installed!

.. tabs::

    .. tab:: Exercise 1.3

        Is the Python package `tensorflow-cpu` installed? If yes, which version?

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            pip list

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            pip list

        In the list, one cannot find ``tensorflow-cpu``.

        So, no, the Python package ``tensorflow-cpu`` is not installed.

    .. tab:: Exercise 1.4

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

    - Practice reading documentation
    - Rehearse the documentation to load a Python machine learning module
    - Apply the documentation to show if a Python package is already installed
    - Observe how it looks like when a package is not installed

Imagine you want to use the Python packages `pandas` and `tensorflow-cpu` and `mhcnuggets`.
Here we see that two come already installed with a Python
machine learning module.

.. tabs::

    .. tab:: Exercise 2.1

        Read [the UPPMAX documentation on Tensorflow](http://docs.uppmax.uu.se/software/tensorflow/).

        Which of the versions should you use?

        Load the latest Python machine learning module for that version.

    .. tab:: Answer HPC2N

        ``TODO``

        Unsure which version you should use, 
        as Kebnekaise has both CPU and GPU.

        Do:

        .. code-block::

            module load ???

    .. tab:: Answer UPPMAX

        Rackham only has CPUs, hence you will need to load the ``cpu`` module:

        Do:

        .. code-block::

            module load python_ML_packages/3.11.8-cpu

.. tabs::

    .. tab:: Exercise 2.2

        Read [the UPPMAX documentation on how to determine if a Python package comes with your Python module](http://docs.uppmax.uu.se/software/python/#determine-if-a-python-package-comes-with-your-python-module).

        Is the Python package `pandas` installed? If yes, which version?

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            pip list

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            pip list

        Then among the list one can find: ``pandas 2.2.0``

        So, yes, the Python package `pandas` version 2.2.0 is installed!

.. tabs::

    .. tab:: Exercise 2.3

        Is the Python package `tensorflow-cpu` installed? If yes, which version?

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            pip list

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            pip list

        In the list, one can find ``tensorflow-cpu``, with version ``2.15.0.post1``.

        So, yes, the Python package ``tensorflow-cpu`` is installed.

    .. tab:: Exercise 2.4

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


Question 3
----------

.. admonition:: Teaching goals

    - Practice reading documentation
    - Install a new package.
    - Rehearse determining if a Python package is already installed

Imagine you want to use the Python packages `pandas` and `tensorflow-cpu` and `mhcnuggets`.
Even when loading a bigger module, one of the packages was not installed for us.
Here we install a Python package ourselves.

.. tabs::

    .. tab:: Exercise 3.1

        Read [the UPPMAX documentation on how to install Python packages using pip](http://docs.uppmax.uu.se/software/python_install_packages/#pip).

        We will be using the first install with ``--user``.

        In which folder do the Python packages end up?

        Try to come up with a reason why would this be important to know.

    .. tab:: Answer

        When using ``--user``, your Python packages end up in the ``.local`` folder.

        This can be important, because it will always be present.
        That is, it is not part of an isolated environment.
        If you, for example, work in an 'isolated' environment and
        run into problems with Python package versions that are not part of it,
        it is probably those packages in your ``.local`` folder.
        This can be solved by removing that ``.local`` folder.

HIERO

.. tabs::

    .. tab:: Exercise 3.2

        Read [the UPPMAX documentation on how to determine if a Python package comes with your Python module](http://docs.uppmax.uu.se/software/python/#determine-if-a-python-package-comes-with-your-python-module).

        Is the Python package `pandas` installed? If yes, which version?

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            pip list

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            pip list

        Then among the list one can find: ``pandas 2.2.0``

        So, yes, the Python package `pandas` version 2.2.0 is installed!

.. tabs::

    .. tab:: Exercise 3.3

        Is the Python package `tensorflow-cpu` installed? If yes, which version?

    .. tab:: Answer HPC2N

        Do:

        .. code-block::

            pip list

    .. tab:: Answer UPPMAX

        Do:

        .. code-block::

            pip list

        In the list, one can find ``tensorflow-cpu``, with version ``2.15.0.post1``.

        So, yes, the Python package ``tensorflow-cpu`` is installed.

    .. tab:: Exercise 3.4

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
  
Links
-----

* `Introduction to Python packages <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_
* `Video: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (YouTube) <https://youtu.be/novRJfAa2QA>`_
* `Video: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (.ogv) <https://richelbilderbeek.nl/use_python_packages_hpc_from_txt.ogv>`_
* `Presentation: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (PDF) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/find_and_use_packages.pdf>`_
* `Presentation: Load and use Python packages on the UPPMAX and HPC2N HPC clusters using pip (ODP) <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/docs/python/find_and_use_packages.odp>`_
    
    
Sloppy Notes

3.11.4 before
3.11.8 new
python_ML_packages/3.11.8-cpu
