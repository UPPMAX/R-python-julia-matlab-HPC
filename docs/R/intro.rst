Introduction R
===================

`Welcome page and syllabus <https://uppmax.github.io/R-python-julia-HPC/index.html>`_
   - Also link by clicking the logo at the top left of the page 

.. admonition:: **Learning outcomes**
   
   - Load R modules and site-installed R packages
   - Install R packages from CRAN - automatic download and install
   - Install R packages manually
   - Write a batchscript for running R
   
.. admonition:: Exercises

    - You can download the exercises from the course GitHub repo, under the "Exercises" directory: https://github.com/UPPMAX/R-python-julia-HPC/tree/main/Exercises
    - On HPC2N, you can copy the exercises in a tarball from TBC
    - On UPPMAX you can copy the exercises in a tarball from TBC
    
.. admonition:: Prepare your environment now!
  
   - Please log in to Rackham, Kebnekaise or other cluster that you are using.
  
.. tabs::

   .. tab:: UPPMAX

      - Rackham: ``ssh <user>@rackham.uppmax.uu.se`` 
      
      - Rackham through ThinLinc, use: ``<user>@rackham-gui.uppmax.uu.se``
      - Create a working directory where you can code along. We recommend creating it under the course project storage directory
   
         
      - Example. If your username is "mrspock" and you are at UPPMAX, this we recommend you create this folder: 
     
         /proj/snic2022-22-641/nobackup/mrspock/pythonUPPMAX

   .. tab:: HPC2N

      - Kebnekaise: ``<user>@kebnekaise.hpc2n.umu.se``     
      - Kebnekaise through ThinLinc, use: ``<user>@kebnekaise-tl.hpc2n.umu.se``
   
      - Create a working directory where you can code along. We recommend creating it under the course project storage directory
   
       - Example. If your username is bbrydsoe and you are at HPC2N, then we recommend you create this folder: 
     
         /proj/nobackup/snic2022-22-641/bbrydsoe/pythonHPC2N
         
What is R?
---------------

As you probably already know…
    
    - R is a programming language for statistical computing and graphics. 
    - R's data structures include vectors, arrays, lists, and data frames.
    - R is an interpreted language; users can access it through a command-line interpreter.
    - It supports procedural programming with functions and, for some functions, object-oriented programming with generic functions. 
    - It has many user-created packages to augment the functions of the R language. These packages offer statistical techniques, graphical devices, import/export, reporting (RMarkdown, knitr, Sweave), etc.
    - It is one of the most commonly used programming languages in data mining.

In short; R has statistics-related libraries of a great variety and provides a good environment for statistical computing and design. Also, the R programming language is very useful for data importing and cleaning.

- The home page of "The R Project for Statistical Computing" is here: https://www.r-project.org/
- Official R documentation is found here: https://cran.r-project.org/manuals.html
- A list of CRAN (The Comprehensive R Archive Network) is here: https://cran.r-project.org/mirrors.html
- Data analysis workflows with R and Python: https://aaltoscicomp.github.io/data-analysis-workflows-course/
- CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Ther material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
    
The two HPC centers UPPMAX and HPC2N
------------------------------------

.. admonition:: Two HPC centers

   - We run this course as a collaboration between the HPC centers HPC2N in Umeå and UPPMAX in Uppsala.
      - There are many similarities:
         - Login vs. calculation/compute nodes
         - Environmental module system with software hidden until loaded with ``module load``
         - Slurm batch job and scheduling system
         - ``pip install`` procedure
      - ... and small differences:
         - commands to load Python and python packages
         - isolated environments ``virtualenv`` vs ``venv``
         - slightly different flags to Slurm
      - ... and some bigger differences:
         - UPPMAX has three different clusters 
            - Rackham for general purpose computing on CPUs only
            - Snowy available for local projects and suits long jobs (< 1 month) and has GPUs
            - Bianca for sensitive data and has GPUs
         - HPC2N has Kebnekaise with GPUs (and KNLs) 
         - Conda is recommended only for UPPMAX users
    
.. admonition:: How is the workshop run?
  
   - General sessions with small differences shown in UPPMAX vs. HPC2N in tabs
   - Separated sessions for UPPMAX and HPC users, respectively.

.. warning:: 

   - At both HPC2N UPPMAX we call the applications available via the *module system* **modules**. 
   - https://www.uppmax.uu.se/resources/software/module-system/ 
   - https://www.hpc2n.umu.se/documentation/environment/lmod
   
   To distinguish these modules from the **python** *modules* that work as libraries we refer to the later ones as **packages**.
   
Briefly about the cluster hardware and system at UPPMAX and HPC2N
-----------------------------------------------------------------

**What is a cluster?**

- Login nodes and calculations nodes

- A network of computers, each computer working as a **node**.
     
- Each node contains several processor cores and RAM and a local disk called scratch.

.. figure:: img/node.png
   :align: center

- The user logs in to **login nodes**  via Internet through ssh or Thinlinc.

  - Here the file management and lighter data analysis can be performed.

.. figure:: img/nodes.png
   :align: center

- The **calculation nodes** have to be used for intense computing. 


Common features
###############

- Intel CPUs
- Linux kernel
- Bash shell

.. list-table:: Hardware
   :widths: 25 25 25 25 25
   :header-rows: 1

   * - Technology
     - Kebnekaise
     - Rackham
     - Snowy
     - Bianca
   * - Cores per calculation node
     - 28 (72 for largemem part)
     - 20
     - 16
     - 16
   * - Memory per calculation node
     - 128-3072 GB 
     - 128-1024 GB
     - 128-4096 GB
     - 128-512 GB
   * - GPU
     - NVidia K80 and V100 
     - None
     - Nvidia T4 
     - 2 NVIDIA A100


.. objectives:: 

    We will:
    
    - teach you how to navigate the module system at HPC2N and UPPMAX
    - show you how to find out which versions of Python and packages are installed
    - look at the package handler **pip** (and **Conda** for UPPMAX)
    - explain how to create and use virtual environments
    - show you how to run batch jobs 
    - show some examples with parallel computing and using GPUs
    - guide you in how to start Python tools for Machine Learning
 

