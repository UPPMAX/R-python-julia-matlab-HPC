Introduction R
==============

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
        
.. admonition:: Exercises

    - You can download the exercises from the course GitHub repo, under the
      "Exercises" directory:
      https://github.com/UPPMAX/R-python-julia-HPC/tree/main/Exercises
    - On HPC2N, you can copy the exercises in a tarball from /proj/nobackup/hpc2n2023-110/Exercises.tar.gz
    - On UPPMAX you can copy the exercises in a tarball from /proj/naiss2023-22-914/Exercises.tar.gz

Preliminary schedule
--------------------

.. list-table:: Preliminary times
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Activity
   * - 9:00
     - Syllabus 
     - 10m
   * - 9.10
     - Introduction, R in general
     - Lecture 10 m 
   * - 9.20
     - Loading modules and running R codes 
     - Lecture+code along 25m
   * - 9.45
     - **Coffee break**
     - 
   * - 10.00
     - Packages
     - Lecture+code along 30m
   * - 10.30
     - Virtual environments
     - Lecture+code along 30m
   * - 11.00
     - **break**
     - 
   * - 11.15
     - HPC2N: Parallel and multithreaded functions
     - Lecture+code along 35m   
   * - 11.50
     - Exercises and informal chat
     - 
   * - 12.00
     - **LUNCH**
     -
   * - 13.00
     - SLURM Batch scripts for R jobs  
     - Lecture+code along + exercise 45m
   * - 13.45
     - **break**
     - 
   * - 14.00
     - Parallel session — UPPMAX: Interactive/Thinlinc and RStudio 
     - Lecture+code along 25m
   * - 14.00
     - Parallel session — HPC2N: Thinlinc and RStudio 
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
   * - 15.00
     - END
     -
       
What is R?
----------

As you probably already know…
    
    - R is a programming language for statistical computing and graphics. 
    - R's data structures include vectors, arrays, lists, and data frames.
    - R is an interpreted language; users can access it through a command-line
      interpreter.
    - It supports procedural programming with functions and, for some
      functions, object-oriented programming with generic functions. 
    - It has many user-created packages to augment the functions of the R
      language. These packages offer statistical techniques, graphical devices,
      import/export, reporting (RMarkdown, knitr, Sweave), etc.
    - It is one of the most commonly used programming languages in data mining.

In short; R has statistics-related libraries of a great variety and provides a
good environment for statistical computing and design. Also, the R programming
language is very useful for data importing and cleaning.

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

