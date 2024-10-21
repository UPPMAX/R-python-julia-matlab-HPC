Isolated environments
=====================

.. tabs::

    .. tab:: Learning objectives

        - remember there are multiple virtual environment managers
        - practice to create, activate, work in and deactive a virtual environment

    .. tab:: For teachers

        Teaching goals are:

        - Learners have heard about Conda
        - Learners have created, activated, worked in and deactived a virtual environment
        - Learners have exported and imported a virtual environment

        Other teaching goals are:

        - Create the virtual environment called ``vpyenv`` needed later on

        Lesson plan (60 minutes in total):

        - 5 mins: prior knowledge
        - How to deal with two tools that need incompatible sets of Python packages?
        - How to solve the problem when there are two tools that need incompatible sets of Python packages?
        - What is a virtual environment manager?
        - Which virtual environment managers exists? 
        - What are the differences between virtual environment managers?
        - 5 mins: presentation
        - Why?
        - Exercises
        - 15 mins: challenge
        - 5 mins: feedback

.. admonition:: Compute allocations in this workshop 

    - Rackham: ``naiss2024-22-1202``
    - Kebnekaise: ``hpc2n2024-114``
    - Cosmos: ``lu2024-7-80``

.. admonition:: Storage space for this workshop 

    - Rackham: ``/proj/r-py-jl-m-rackham``
    - Kebnekaise: ``/proj/nobackup/r-py-jl-m``

Introduction
------------

Different experiments may need different versions of Python and/or Python packages.
Virtual environments allow one to work with multiple sets of (potentially incompatible) packages, where each set is independent and isolated.

Additionally, you may want to have a reproducible computational environment, so that others can reproduce your computational experiments.
Virtual environments can be exported and imported to provide for better reproducible computational environments.

In this session, we create, activate, use, deactivate, export and import some virtual environments.

Virtual environment managers
----------------------------

.. mermaid:: isolated.mmd

In this course, we will look at the following environment managers:

+---------------+-----------------+---------------+-----------------------+------------------+
| Manager       | HPC2N           | LUNARC        | UPPMAX's Rackham      |Scope             |
+===============+=================+===============+=======================+==================+
| ``conda``     | Avoid           | OK            | Avoid                 |Language agnostic |
+---------------+-----------------+---------------+-----------------------+------------------+
| ``venv``      | Recommended     | ?Undocumented | Recommended           |Python only       |
+---------------+-----------------+---------------+-----------------------+------------------+

All centers have their documentation on virtual environment managers:

- `HPC2N working with venv <https://docs.hpc2n.umu.se/tutorials/userinstalls/#working__with__venv>`_
- `LUNARC creating conda environments <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Python/#creating-conda-environments>`_ (uses conda)
- `UPPMAX virtual environments <http://docs.uppmax.uu.se/software/python_virtual_environments/>`_

In this session, we use ``venv``, as it works for all centers.

- `HPC2N venv <https://docs.hpc2n.umu.se/tutorials/userinstalls/#venv>`_
- LUNARC: TODO
- `UPPMAX venv <https://docs.uppmax.uu.se/software/python_venv/>`_


General workflow
----------------

.. mermaid:: isolated_workflow.mmd

Whatever environment manager you use, this is the workflow:

- You create the isolated environment
- You activate the environment
- You work in the isolated environment. 
  Here you install (or update) the environment with the packages you need
- You deactivate the environment after use 

A virtual environment can be created in multiple ways, for example, from scratch.
However, there are more efficient ways, which we will use.

Exercises
---------

In these exercises, we create multiple virtual environments.

+----------+--------------------------+------------------------------------+
| Exercise | Virtual environment name | Time to install packages (minutes) |
+==========+==========================+====================================+
| 1        | ``vpyenv``               | 1                                  |
+----------+--------------------------+------------------------------------+

Exercise 0: remove the Python packages installed in the home folder
-------------------------------------------------------------------

In the previous session, we have installed Python packages in the home folder. This will interfere with our virtual environments.

To make sure your virtual environments work, ruthlessly delete the Python packages in your home folder:

.. code-block:: console

    rm -Ir ~/.local/lib/python3.11

You will be asked to confirm.

Exercise 1: work with ``vpyenv``
--------------------------------

.. tabs::

   .. tab:: Learning objectives

       - Create a Python virtual environment from a step-by-step instruction

   .. tab:: For teachers

       Takes around 3 minutes for an experienced user

In this exercise, we create the course environment ``vpyenv``
in a step-by-step fashion:

.. mermaid:: isolated_workflow_vpyenv.mmd

We create the virtual environment needed for this course, called ``vpyenv``.
As virtual environments can take up a lot of disc space,
we create it in the course project folder.

Exercise 1.1: load the modules needed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX
      
      .. code-block:: console

          module load python/3.11.8

   .. tab:: HPC2N
     
      .. code-block:: console

          module load GCC/12.3.0 Python/3.11.3 SciPy-bundle/2023.07 matplotlib/3.7.2

Exercise 1.2: create the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      Create the virtual environment called ``vpyenv`` as such:      

      .. code-block:: console

          $ python -m venv --system-site-packages /proj/r-py-jl/[username]/python/vpyenv

      where ``[username]`` is your UPPMAX username, for example ``python -m venv --system-site-packages /proj/r-py-jl/sven/python/vpyenv``.

   .. tab:: HPC2N

      Create the virtual environment called ``vpyenv`` as such:      
     
      .. code-block:: console

          $ python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/[username]/python/vpyenv

      where ``[username]`` is your HPC2N username, for example ``python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/sven/python/vpyenv``.


Exercise 1.3: activate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      Activate the virtual environment called ``vpyenv`` as such:      

      .. code-block:: console

          source /proj/r-py-jl/[username]/python/vpyenv/bin/activate

      where ``[username]`` is your UPPMAX username, for example ``python -m venv --system-site-packages /proj/r-py-jl/sven/python/vpyenv``.

   .. tab:: HPC2N

      Activate the virtual environment called ``vpyenv`` as such:      
     
      .. code-block:: console

            source /proj/nobackup/hpc2n2024-025/[username]/python/vpyenv/bin/activate

      where ``[username]`` is your HPC2N username, for example ``python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/sven/python/vpyenv``.


Exercise 1.4: install Python packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      Install the ``spacy`` and ``seaborn`` packages

      .. code-block:: console

          pip install --user spacy seaborn

   .. tab:: HPC2N

      Install the ``spacy`` and ``seaborn`` packages
     
      .. code-block:: console

          pip install --no-cache-dir --no-build-isolation spacy seaborn 

Exercise 1.5: check if the Python packages are installed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      To see all installed Python packages:

      .. code-block:: console

            pip list

      To see which Python packages you have installed yourself 
      (i.e. not loaded from a module), use:

      .. code-block:: console

            pip list --user

   .. tab:: HPC2N

      .. code-block:: console

            pip list

      To see which Python packages you have installed yourself 
      (i.e. not loaded from a module), use:

      .. code-block:: console

            pip list --user

Exercise 1.6: use the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      Start Python and import a Python package:

      .. code-block:: console
           
         (vpyenv) $ python
         Python 3.11.8 (main, Feb  8 2024, 11:48:52) [GCC 12.3.0] on linux
         Type "help", "copyright", "credits" or "license" for more information.
         >>> import spacy
         >>> 

   .. tab:: HPC2N

      Start Python and import a Python package:

      .. code-block:: console

         (vpyenv) b-an01 [/proj/nobackup/hpc2n2024-025/bbrydsoe/python]$ python
         Python 3.11.3 (main, Oct 30 2023, 16:00:15) [GCC 12.3.0] on linux
         Type "help", "copyright", "credits" or "license" for more information.
         >>> import spacy
         >>> 

Exercise 1.7: deactivate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: console

            deactivate

   .. tab:: HPC2N

      .. code-block:: console

            deactivate

Well done, you've just created a virtual environment called ``vpyenv``!


Conclusion
----------

.. keypoints::

    You have:

    - heard that virtual environments allows one for independent and isolated 
      set of Python packages
    - heard that there are multiple virtual environments managers:
        - UPPMAX: Conda and ``venv``
        - HPC2N has ``venv``
    - created, activated, used and deactivated virtual environments
    - installed Python packages by using a ``requirements.txt`` file

    You may:

    - consider to create a virtual environment per project, 
      to provide for better reproducibility

Links
-----

- UPPMAX's documentation pages about installing Python packages and virtual environments: https://docs.uppmax.uu.se/software/python/
- HPC2N's documentation pages about installing Python packages and virtual environments: https://www.hpc2n.umu.se/resources/software/user_installed/python
- `Video: How to use a Python venv on the Rackham UPPAX cluster (YouTube) <https://youtu.be/OjftEQ23xYk>`_
- `Dependency management from coursePython for Scientific computing <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_
