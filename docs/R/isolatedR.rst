Isolated environments
=====================

.. note::
   Isolated environments solve a couple of problems:
   
   - You can install specific, also older, versions into them.
   - You can create one for each project and no problem if the two projects require different versions.
   - You can remove the environment and create a new one, if not needed or with errors.
   
R is not very well known for virtual environments like Python and Julia. However:

>The ``renv`` package is a new effort to bring project-local R dependency management to your projects. The goal is for renv to be a robust, stable replacement for the Packrat package, with fewer surprises and better default behaviors.



.. questions::

   - How to work with isolated environments at HPC2N and UPPMAX?
 
.. objectives:: 

   - Give a general 'theoretical* introduction to isolated environments .

General procedures   
------------------

You will now and then  have the situation that your project(s) use different versions of R and different versions of packages. This is great if you need different versions of a package for different tasks, for instance. This is easily solved with isolated environments.

Isolated environments lets you create separate workspaces for different versions of R and/or different versions of packages. You can activate and deactivate them one at a time, and work as if the other workspace does not exist.

>Underlying the philosophy of ``renv`` is that any of your existing workflows should just work as they did before – ``renv`` helps manage library paths (and other project-specific state) to help isolate your project’s R dependencies, and the existing tools you’ve used for managing R packages (e.g. ``install.packages()``, ``remove.packages()``) should work as they did before.
https://rstudio.github.io/renv/articles/renv.html

Workflow
--------

The general workflow when working with ``renv`` is:

    1. Call ``renv::init()`` to initialize a new project-local environment with a private R library,

    2. Work in the project as normal, installing and removing new R packages as they are needed in the project,

    3. Call ``renv::snapshot()`` to save the state of the project library to the lockfile (called ``renv.lock``),

    4. Continue working on your project, installing and updating R packages as needed.

    5. Call ``renv::snapshot()`` again to save the state of your project library if your attempts to update R packages were successful, or call ``renv::restore()`` to revert to the previous state as encoded in the lockfile if your attempts to update packages introduced some new problems.

The ``renv::init()`` function attempts to ensure the newly-created project library includes all R packages currently used by the project. It does this by crawling R files within the project for dependencies with the ``renv::dependencies()`` function. The discovered packages are then installed into the project library with the r``env::hydrate()`` function, which will also attempt to save time by copying packages from your user library (rather than reinstalling from CRAN) as appropriate.

Calling ``renv::init()`` will also write out the infrastructure necessary to automatically load and use the private library for new R sessions launched from the project root directory. This is accomplished by creating (or amending) a project-local .Rprofile with the necessary code to load the project when the R session is started.

If you’d like to initialize a project without attempting dependency discovery and installation – that is, you’d prefer to manually install the packages your project requires on your own – you can use ``renv::init(bare = TRUE)`` to initialize a project with an empty project library.




.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environemnts.
      - UPPMAX has  Conda and venv
      - HPC2N has virtualenv.
      - More details in the separated sessions!
 
   
