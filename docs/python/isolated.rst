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

Exercises
---------

Exercise 1: work with ``vpyenv``
--------------------------------

.. admonition:: Teaching goals

    - Create a Python virtual environment from a step-by-step instruction

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

Step 2: create the ``venv``
^^^^^^^^^^^^^^^^^^^^^^^^^^^

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


Step 3: activate the ``venv``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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


Step 4: install Python packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      Install the ``spacy`` and ``seaborn`` packages

      .. code-block:: console

          pip install --user spacy seaborn

   .. tab:: HPC2N

      Install the ``spacy`` and ``seaborn`` packages
     
      .. code-block:: console

          pip install --no-cache-dir --no-build-isolation spacy seaborn 

Step 5: check if the Python packages are installed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

Step 6: use the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

Step 7: deactivate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: console

            deactivate

   .. tab:: HPC2N

      .. code-block:: console

            deactivate

Well done, you've just created a virtual environment called ``vpyenv``!

Exercise 2: work with ``Example-gpu``
-------------------------------------

.. admonition:: Teaching goals

    - Rehearse creating a Python virtual environment from a step-by-step instruction

This exercise if for UPPMAX users only.

In this exercise, we create another environment ``Example-gpu``
in the same step-by-step fashion as done in exercise 1:

.. mermaid:: isolated_workflow_vpyenv.mmd

This virtual environment called ``Example-gpu`` 
is used for examples where the use of GPUs is demonstrated,
by using the ``numba`` and ``PyTorch`` Python packages.

Because the structure is the same as Exercise 1, see exercise 1 for details.

Step 1: load the modules needed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Here we need an older Python module, 
as that is what available on the Snowy computer cluster:

.. code-block:: console

    module load python/3.9.5

Step 2: create the ``venv``
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console

    python -m venv --system-site-packages /proj/r-py-jl/<user>/python/Example-gpu

where ``[username]`` is your UPPMAX username, for example ``python -m venv --system-site-packages /proj/r-py-jl/sven/python/Example-gpu``.

Step 3: activate the ``venv``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console

    source /proj/r-py-jl/<user>/python/Example-gpu/bin/activate

where ``[username]`` is your UPPMAX username, for example ``source /proj/r-py-jl/sven/python/Example-gpu/bin/activate``.

Step 4: install Python packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. prompt:: 
    :language: bash
    :prompts: (Example-gpu) $

    pip install --upgrade numpy scipy numba torch


Step 5: check if the Python packages are installed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. prompt:: 
    :language: bash
    :prompts: (vpyenv) $

    pip list

Step 6: use the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



Step 7: deactivate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. prompt:: 
    :language: bash
    :prompts: (Example-gpu) $

    deactivate

Exercise 3: export and import a ``venv``
----------------------------------------

.. admonition:: Teaching goals

    - Rehearse creating a Python virtual environment
    - Export a ``venv`` from reading documentation
    - Import a ``venv`` from reading documentation

In this exercise, we export and import a ``venv`` virtual environment.
Additionally, you get to rehearse to create a ``venv`` 
like we have done earlier: answers will now be hidden.

.. mermaid:: isolated_workflow_vpyenv.mmd


Step 1: load the modules needed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 1: load the modules needed

      Load the modules for Python 3.11.x.

   .. tab:: UPPMAX

      .. code-block:: console

          module load python/3.11.8

   .. tab:: HPC2N

      .. code-block:: console

          module load GCC/12.3.0 Python/3.11.3 

Step 2: create the ``venv``
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 2: create the ``venv``

      Create a virtual environment with the name ``analysis``.

   .. tab:: UPPMAX

      .. code-block:: console

          python -m venv --system-site-packages /proj/r-py-jl/[username]/python/analysis

   .. tab:: HPC2N

      .. code-block:: console

          python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/[username]/python/analysis 


Step 3: activate the ``venv``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 3: activate the ``venv``

      Activate the virtual environment.

   .. tab:: UPPMAX

      .. code-block:: console

          source /proj/r-py-jl/[username]/python/analysis/bin/activate

   .. tab:: HPC2N

      .. code-block:: console

          source /proj/nobackup/hpc2n2024-025/[username]/python/analysis/bin/activate

Step 4: install Python packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step pre-4: create file

       Create a file called ``requirements.txt``, with the following content:

       .. code-block:: sh

           numpy==1.22.3
           matplotlib==3.5.2
           pandas==1.4.2

   .. tab:: UPPMAX

      Use any editor.

   .. tab:: HPC2N

      Use any editor.


.. tabs::

   .. tab:: Step 4: install Python packages

       Install packages by using the ``requirements.txt`` file.

   .. tab:: UPPMAX

      .. code-block:: console

          pip install -r requirements.txt

   .. tab:: HPC2N

      .. code-block:: console

          pip install -r requirements.txt


Step 5: check if the Python packages are installed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 5: check if the Python packages are installed

       Check that the packages were installed.

   .. tab:: UPPMAX

      .. code-block:: console

          pip list

   .. tab:: HPC2N

      .. code-block:: console

          pip list



Step 6: use the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Not now :-)

Step 7: deactivate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



.. tabs::

   .. tab:: Step 7: deactivate the virtual environment

       Deactivate the virtual environment

   .. tab:: UPPMAX

      .. code-block:: console

          deactivate

   .. tab:: HPC2N

      .. code-block:: console

          deactivate

Conclusion
---------

.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environments.
   
      - UPPMAX has Conda and venv: Conda is discussed in a separate UPPMAX-only session.
      - HPC2N has venv


Links
-----

- UPPMAX's documentation pages about installing Python packages and virtual environments: https://www.uppmax.uu.se/support/user-guides/python-user-guide/
- HPC2N's documentation pages about installing Python packages and virtual environments: https://www.hpc2n.umu.se/resources/software/user_installed/python
- `Video: How to use a Python venv on the Rackham UPPAX cluster (YouTube) <https://youtu.be/OjftEQ23xYk>`_
- `Dependency management from coursePython for Scientific computing <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_

Dead links on purpose
---------------------

- `Dead external links <https://www.abs.ent>`_
- Dead other page :doc:`absent_page.rst`
