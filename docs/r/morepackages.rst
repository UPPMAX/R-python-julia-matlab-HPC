More about R packages

R packages: A short Primer
--------------------------

What is a package, really?
##########################

An R package is essentially a contained folder and file structure containing R
code (and possibly C/C++ or other code) and other files relevant for the
package e.g. documentation(vignettes), licensing and configuration files. Let
us look at a very simple example


.. code-block:: console

   $ git clone https://github.com/MatPiq/R_example.git

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


.. admonition:: Installing tree as non-root on Linux Ubuntu
   :class: dropdown

      If you are on a Linux Ubuntu system where tree is not installed, and you do not have root permissions, you can do this to install it in your own area

      1) Create a directory (in your home folder) to install in:

      .. code-block: console

         mkdir ~/mytree

      Change to that directory:

      .. code-block:: console

         cd ~/mytree

      Now download tree:

      .. code-block:: console

         apt download tree

      Unpack the files:

      .. code-block:: console

         dpkg-deb -xv ./*deb ./

      You can use tree like this now, giving the full path:

      .. code-block:: console

         ~/mytree/usr/bin/tree

      **Note**: if you want to be able to use it with the command "tree" you could set an alias in your ~/.bashrc file and then ``source`` it:

      .. code-block:: console

         echo 'alias tree="$HOME/mytree/usr/bin/tree"' >> ~/.bashrc
         source ~/.bashrc


Package states
##############

An R packages can exist in five possible states

- Source: "source code" or "source files". Development form.
- Bundled: The source code compressed into a single file, usually `tar.gz` and
  sometimes referred to as "source tarballs". Files in `.Rbuildignore` are
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

.. role:: raw-html(raw)
    :format: html

:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`

| Source:
| https://r-pkgs.org/structure.html and
| https://nbisweden.github.io/RaukR-2021/rpackages_Sebastian/presentation/rpackages_Sebastian.html

