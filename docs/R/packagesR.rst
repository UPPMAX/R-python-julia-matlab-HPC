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
   :width: 600
   :align: left


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
way to check is probably starting the interpreter and running the ``libPaths()`` function.


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

Sometimes you will need R packages that are not already installed. The solution to this is to install your own packages. These packages will usually come from CRAN (https://cran.r-project.org/) - the Comprehensive R Archive Network, or sometimes from other places, like GitHub. 

Here we will look at installing R packages with automatic download and with manual download. It is also possible to install from inside Rstudio. 

Setup
#####

We need to create a place for the own-installed packages to be and to tell R where to find them. The initial setup only needs to be done once, but separate package directories need to be created for each R version used. 

R reads the ``$HOME/.Renviron`` file to setup its environment. It should be created by R on first run, or you can create it with the command: ``touch $HOME/.Renviron``

**NOTE**: In this example we are going to assume you have chosen to place the R packages in a directory under your home directory. As mentioned, you will need separate ones for each R version.

If you have not yet installed any packages to R yourself, the environment file should be empty and you can update it like this: 

.. code-block:: sh 

    echo R_LIBS_USER=\"$HOME/R-packages-%V\" > ~/.Renviron

If it is **not** empty, you can edit ``$HOME/.Renviron`` with your favorite editor so that ``R_LIBS_USER`` contain the path to your chosen directory for own-installed R packages. It should look something like this when you are done:

.. code-block:: sh 

    R_LIBS_USER="/home/u/user/R-packages-%V"


| NOTE: Replace ``/home/u/user`` with the value of ``$HOME``. Run ``echo $HOME`` to see its value.
| NOTE: The ``%V`` should be written as-is, it's substituted at runtime with the active R version.

For each version of R you are using, create a directory matching the pattern used in ``.Renviron`` to store your packages in. This example is shown for R version 4.0.4:

.. code-block:: sh 

    mkdir -p $HOME/R-packages-4.0.4


Automatical download and install from CRAN
##########################################

.. tabs::

   .. tab:: From command line

      .. code-block:: sh 

          R --quiet --no-save --no-restore -e "install.packages('<r-package>', repos='<repo>')"
    
    
      You find the name of the package in CRAN (https://cran.r-project.org/) and a list of repos here: https://cran.r-project.org/mirrors.html 

      Please choose a location close to you when picking a repo. 

   .. tab:: From inside R

      .. code-block:: sh 

          install.packages('<r-package>', repos='<repo>')
   
   
Example
*******

In this example, we will install the R package ``stringr`` and use the repository http://ftp.acc.umu.se/mirror/CRAN/ 

.. code-block:: sh 

    R --quiet --no-save --no-restore -e "install.packages('stringr', repos='http://ftp.acc.umu.se/mirror/CRAN/')"



Manual download and install
###########################

R CMD INSTALL -l <path-to-R-package>/R-package.tar.gz

Example
*******

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
