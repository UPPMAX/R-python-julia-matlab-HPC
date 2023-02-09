Using RStudio
===============

There is a system installed version, available via the "rstudio" command (you
will get RStudio/1.1.423). 

However, we recommend you to use a RStudio module.

Also, we recommend to use ThinLinc.

- start a command line window
- load R_packages/4.1.1, use 'module help R_packages/4.1.1' to see what is
  available in this certain version module load RStudio/1.4.1106
- run 'rstudio &' from the command line, and wait
  - it might take 5-10 minutes for RStudio to start, but once it starts, there
    should be no further delays
  - do *not* start RStudio through the graphical menu system in ThinLinc, this
    will not have access to loaded modules.
  - if it takes a long time and might be due to that you have saved a lot of
    workspace
  
Example:

.. code:: bash 

   $ module load R_packages/4.1.1
   $ module load RStudio/2022.02.0-443
   $ rstudio &


If you're going to run heavier computations within RStudio then you have to
remember that you need to do it inside an interactive session on one of the
computation nodes, and not on a login node. But if you mostly want to use it as
a pretty code editor then you can run it on the login node as well. RStudio on
Bianca

On Bianca
''''''''''

When logging onto Bianca, you are placed on a login node, which nowadays has 2
CPU and a few GB of RAM. This is sufficient for doing some lightweight
calculations, but interactive sessions and batch jobs provide access to much
more resources and should be requested via the SLURM system.


