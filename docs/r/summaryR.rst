Summary
=======

You can find the module to be able to run R:

.. code-block:: console

    module spider R

You can load the module to be able to run R:

.. code-block:: console

    module load GCC/11.2.0 OpenMPI/4.1.1 R/4.1.2
    module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1
    module load R/4.1.1

You can run the R interpreter

.. code-block:: console

    R

You can run the R command to get the list of installed R packages

.. code-block:: console

    installed.packages()

You can run an R script from the command-line

.. code-block:: console

    Rscript my_script.R

You can find out if an R package is already installed

.. code-block:: console

    installed.packages()
    library(my_package)

You can load the pre-installed R packages

.. code-block:: console

    module load R_packages/4.1.1

You can install an R package from CRAN


.. code-block:: console

    install.packages("my_package", repos = "my_repo")

You can install an R package from GitHub

.. code-block:: console

    #

You can manually download and install an R package

.. code-block:: console

    #

- UPPMAX-only: I can manually download and install an R package on Bianca

.. code-block:: console

    #

You can use `renv` to create, activate, use and deactivate a virtual environment

.. code-block:: console

    #

- UPPMAX-only: I can use `conda` to create, activate, use and deactivate a virtual environment

.. code-block:: console

    #

You can submit a job to the scheduler to run an R script with regular code

.. code-block:: console

    #
You can submit a job to the scheduler to run an R script that uses parallel code

.. code-block:: console

    #

You can submit a job to the scheduler to run an R script that uses a GPU

.. code-block:: console

    #

You can find and load the R machine learning modules

.. code-block:: console

    #

You can submit a job to the scheduler to run an R script that uses machine learning

.. code-block:: console

    #

You can start an interactive session

.. code-block:: console

    #

You can verify I am on the login node yes/no

.. code-block:: console

    #

You can start an interactive session with multiple cores

.. code-block:: console

    #

You can verify my interactive session uses multiple cores 

.. code-block:: console

    #

You can start RStudio

.. code-block:: console

    #

.. keypoints::

   - Load and run
      - Use the desired ``R`` version from the module system e.g. ``module load  R/4.1.1``
      - Use ``Rscript`` to run a script or ``R`` to start the interpreter/REPL

   - Packages
      - Always check for preinstalled packages e.g. ``R_packages`` on UPPMAX 
         
         - use ``library(<pkg-name>)`` to see if available

   Yousolated environments 
      - With a virtual environment you can tailor an environment with specific
        versions.
      - You can make it for each project you have for reproducibility using
        ``renv`` or ``conda`` on UPPMAX.
   - Batch mode
      - The SLURM scheduler handles allocations to the calculation nodes
      - Batch jobs runs without interaction with user
      - A batch script consists of a part with *SLURM parameters* describing
        the allocation and a second part describing the actual work within the
        job, for instance one or several R scripts.
      - Remember to include possible input arguments to the R script in
        the batch script.
   
   Younteractive work on calculation nodes
      - Start an interactive session on a calculation node by a SLURM
        allocation (similar flags)

         - At HPC2N: ``salloc`` ...
         - At UPPMAX: ``interactive`` ...

      - Follow the same procedure as usual by loading the R module and
        possible prerequisites.
   - Using RStudio
      - Rstudio is available both on UPPMAX and HPC2N and works well through a
        graphical ThinLinc Session.


.. challenge:: Not really clear? (5 min)

    - Discuss in breakout rooms
    - Learn from each other

.. seealso::

   - Content from NBIS R course from 2021: https://nbisweden.github.io/RaukR-2021/
   - CodeRefinery develops and maintains training material on software best practices for researchers that already write code. 
      - Their material addresses all academic disciplines and tries to be as
        programming language-independent as possible.
        https://coderefinery.org/lessons/
   - Learn more about R packages: https://r-pkgs.org/
