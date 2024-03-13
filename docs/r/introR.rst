Introduction R
==============

.. tabs::

   .. tab:: Learning objectives

      - Understand what an interactive session is

   .. tab:: For teachers

      Teaching goals are:

      - Learners have heard what an interactive session is

      Lesson plan (10 minutes in total):

      - 5 mins: prior knowledge
         - What types of nodes do our HPC clusters have?
         - What is the purpose of each of these nodes?
         - Imagine you are developing a Python script in a line-by-line fashion. How to do so best?
         - Why not do so on the login node?
         - Why not do so by using ``sbatch``?
      - 5 mins: presentation
      - 5 mins: challenge
      - 5 mins: recap
         - What is the drawback of using an interactive node?


`Welcome page and syllabus <https://uppmax.github.io/R-python-julia-HPC/index.html>`_
   - Also link by clicking the logo at the top left of the page 

.. admonition:: **Learning outcomes**
   
   - Load R modules and site-installed R packages
   - Install R packages from CRAN - automatic download and install
   - Write a batch script for running R
   - Using Rstudio

**Not covered**
    
   - improve R *coding* skills 
   - Other clusters
        
.. admonition:: Exercise files

    - You can download the (files of the) exercises from the course GitHub repo, 
      under the "Exercises" directory:
      https://github.com/UPPMAX/R-python-julia-HPC/tree/main/Exercises
    - On HPC2N, you can copy the exercises in a tarball 
      from ``/proj/nobackup/hpc2n2024-025/Exercises.tar.gz``
    - On UPPMAX you can copy the exercises in a tarball 
      from ``/proj/naiss2024-22-107/Exercises.tar.gz``

.. challenge:: Download the exercise files

    Download the exercise files on your favorite cluster.

Preliminary schedule
--------------------

.. mermaid:: intro_r_overview_course.mmd 

.. list-table:: Preliminary times
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Activity
   * - 9:00
     - Syllabus 
     - 10m
   * - 9:10
     - Introduction, R in general
     - Lecture 10 m 
   * - 9:20
     - Loading modules and running R codes 
     - Lecture+code along 25m
   * - 9:45
     - **Coffee break**
     - 
   * - 10:00
     - Packages
     - Lecture+code along 30m
   * - 10.30
     - Isolated environments
     - Lecture+code along 20m
   * - 10:50
     - **break**
     - 
   * - 11:00
     - SLURM Batch scripts for R jobs  
     - Lecture+code along + exercise 30m
   * - 11:30
     - Parallel and multithreaded functions
     - Lecture+code along 35m   
   * - 12:00
     - **LUNCH**
     -
   * - 13.00
     - Exercises and informal chat (or break) 
     - 
   * - 13.15
     - ML  
     - Lecture+code along 35m
   * - 13:50
     - **break**
     - 
   * - 14.00
     - Parallel session - HPC2N: ThinLinc & RStudio 
     - Lecture+code along 25m
   * - 
     - Parallel session - UPPMAX: Interactive/ThinLinc & RStudio
     - Lecture+code along 25m 
   * - 14.25
     - Summary 
     -
   * - 14.35
     - Evaluation
     -
   * - 14.45
     - Q&A on-demand
     -
   * - 15:00
     - END
     -
       

What is R?
----------

R is a programming language for statistical computing and data visualization
(from `Wikipedia <https://en.wikipedia.org/wiki/R_(programming_language>`_).

.. mermaid:: intro_r_overview_r.mmd 

- The home page of "The R Project for Statistical Computing" is here:
  https://www.r-project.org/
- Official R documentation is found here:
  https://cran.r-project.org/manuals.html
- A list of CRAN (The Comprehensive R Archive Network) is here:
  https://cran.r-project.org/mirrors.html
    
Material for improving your programming skills
::::::::::::::::::::::::::::::::::::::::::::::

First level
...........

`The Carpentries <https://carpentries.org/>`_  teaches basic lab skills for research computing.

- `Programming with R <swcarpentry.github.io/r-novice-inflammation/>`_ 

- `R for reproducible scientific analysis <https://swcarpentry.github.io/r-novice-gapminder/>`_ 

Second level
::::::::::::

CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Their material addresses all academic disciplines and tries to be as programming language-independent as possible. 

- `Lessons <https://coderefinery.org/lessons/)>`_ 
- Not yet anything R specific


Aalto Scientific Computing

- `Data analysis workflows with R and Python <https://aaltoscicomp.github.io/data-analysis-workflows-course/>`_


Overview of NAISS centres and their R documentation
---------------------------------------------------

- `C3SE <https://www.c3se.chalmers.se/documentation/applications/r/>`_
- `HPC2N <https://www.hpc2n.umu.se/resources/software/r>`_
- `LUNARC <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Rscript/>`_
- `NSC <https://ipv4.www.nsc.liu.se/software/catalogue/tetralith/modules/r.html>`_
- `PDC <https://www.pdc.kth.se/software/software/R/index_general.html>`_
- `UPPMAX <http://docs.uppmax.uu.se/software/r/>`_


.. objectives:: 

    We will:
    
    - teach you how to navigate the module system at HPC2N and UPPMAX
    - show you how to find out which versions of R and packages are installed
    - look at how to install other R packages yourself
    - show you how to run batch jobs 
    - show some examples on using R 
    - Show you how to start up Rstudio and give a brief intro to the tool 

