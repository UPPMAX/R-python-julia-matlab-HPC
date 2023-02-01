Packages
========

.. admonition:: R packages

   - R packages is the main way of extending the functionallity of R and
     **broadens the use of R** to almost infinity! 

   - Instead of writing code yourself there may be others that have done the
     same!

   - Many **scientific tools** are distributed as **R packages**, making it
     possible to run a script in the prompt and there define files to be
     analysed and arguments defining exactly what to do.

   - For more details about packages and in particular developing your own,
     see: `R packages <https://r-pkgs.org>`_

.. questions::
   
   - What is an R package?
   - How do I find which packages and versions are available?
   - What to do if I need other packages?
   - Are there differences between HPC2N and UPPMAX?
   
.. objectives:: 

   - Understand the basics of what an R package is
   - Show how to check for R packages
   - show how to install own packages on the different clusters


R packages: A short Primer
--------------------------

What is a package, really?
##########################

An R package is essentialy a contained folder and file structure containing R
code (and possibly C/C++ or other code) and other files relevant for the
package e.g. documentation(vignettes), licensing and configuration files. Let
us look at a very simple example 


.. code-block:: sh

   $ git clone git@github.com:MatPiq/R_example.git

   $ cd R_example

   $ tree
   .
   ├── DESCRIPTION
   ├── NAMESPACE
   ├── R
   │   └── hello.R
   ├── man
   │   └── hello.Rd
   └── r_example.Rproj

Package states
##############

An R packages can exist in five possible states

- Source: The example above - "source code" or "source files". Development
  form.
- Bundled: The source code compressed into a single file, usually `tar.gz` and
  sometimes refered to as "source tarballs". Files in `.Rbuildignore` are
  excluded.
- Binary: A compressed and pre-compiled version of a bundle built for a
  specific architecture. Usually how the package is provided by CRAN. Much
  faster than having to compile yourself and no need for dev/build tools.
- Installed: A decompressed binary package located in a package _library_ (more
  on this later).
- In-memory: When the installed package has been loaded from the library into
  memory, using `require(pkg)` or `library(pkg)`.


.. figure:: ../../img/R-pkg-states.png
   :width: 450
   :align: center

source: https://r-pkgs.org/structure.html and
https://nbisweden.github.io/RaukR-2021/rpackages_Sebastian/presentation/rpackages_Sebastian.html

Package libraries
#################

    In R, a library is a directory containing installed packages, sort of like
    a library for books. Unfortunately, in the R world, you will frequently
    encounter confused usage of the words “library” and “package”. It’s common
    for someone to refer to dplyr, for example, as a library when it is
    actually a package (Wickham & Hadley, 2023).

We might want to know where the ``R`` interpreter will be searching for
packages, i.e. where the libraries are located (could be several). The easiest
way to check if probably starting the inerpreter and running


.. tabs::

   .. tab:: UPPMAX

      Load ``R``, e.g. version 4.1.1 and start the Interpreter

      .. code-block:: sh 

         $ ml R/4.1.1
         $ R

      Then check find the path of the library using the ``libPaths()`` function.

      .. code-block:: R
         > .libPaths()
         [1] "/sw/apps/R/4.1.1/rackham/lib64/R/library"
	
   .. tab:: HPC2N
   
      Load ``R``, e.g. version 4.1.1 and start the Interpreter

      .. code-block:: sh 

         $ ml GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4
         $ R

      Then check find the path of the library using the ``libPaths()`` function.

      .. code-block:: R
         > .libPaths()
         [1] "/cvmfs/ebsw.hpc2n.umu.se/amd64_ubuntu2004_bdw/software/R/4.0.4-foss-2020b/lib/R/library"





Installing your own packages
----------------------------



.. note::
   
   You will test this in the separated sessions about isolated environments in a while.

.. keypoints::

   - You can check for packages 
   	- from the Python shell with the ``import`` command
	- from BASH shell with the 
		- ``pip list`` command at both centers
		- ``ml help python/3.9.5`` at UPPMAX
   - Installation of Python packages can be done either with **PYPI** or **Conda**
   - You install own packages with the ``pip install`` command (This is the recommended way on HPC2N)
   - At UPPMAX Conda is also available (See Conda section)
