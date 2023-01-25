Introduction Python
===================

`Welcome page and syllabus <https://uppmax.github.io/HPC-python/index.html>`_
   - Also link at House symbol |:house:| at top of page 

.. admonition:: **Learning outcomes**
   
   - Load Python modules and site-installed Python packages
   - Create a virtual environment
   - Install Python packages with pip (Kebnekaise, Rackham, Snowy)
   - Install Python packages with conda (Bianca)
   - Write a batchscript for running Python

  
.. admonition:: Exercises

    - You can download the exercises from the course GitHub repo, under the "Exercises" directory: https://github.com/UPPMAX/HPC-python/tree/main/Exercises 
    - On HPC2N, you can copy the exercises in a tarball from ``/proj/nobackup/snic2022-22-641/bbrydsoe/examples.tar.gz``
    - On UPPMAX you can copy the exercises in a tarball from ``/proj/snic2022-22-641/nobackup/examples.tar.gz``
    
.. admonition:: **Your expectations?**
   
    - find best practices for using Python at UPPMAX and HPC2N
    - packages
    - use the HPC performance with Python

    
    **Not covered**
    
    - improve python *coding* skills 
    - Other clusters

Preliminary schedule
--------------------

.. list-table:: Preliminary schedule
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Activity
   * - 9:00
     - Syllabus 
     -
   * - 9.10
     - Introduction 
     - Lecture
   * - 9.25
     - Loading modules and running Python codes 
     - Lecture+code along
   * - 9.50
     - Dealing with packages  
     - Lecture+code along
   * - 10.00
     - **Coffee**
     - packages cont'd
   * - 10.15
     - Dealing with packages  
     - Lecture+code along
   * - 10.30
     - Isolated environments (general)
     - Lecture+code along
   * - 10.50
     - SLURM Batch scripts for Python jobs  
     - Lecture+code along + exercise
   * - 11.10
     - Interactive
     - Lecture+code along
   * - 11.40
     - **Short leg stretch**
     - 
   * - 11.45
     - Additional exercises 
     -
   * - 12.10
     - Summary 
     -
   * - 12.20
     - Q&A on-demand
     -
   * - 12.30
     - END
     -
    

What is python?
---------------

As you probably already know…
    
    - “Python combines remarkable power with very clear syntax.
    - It has modules, classes, exceptions, very high level dynamic data types, and dynamic typing. 
    - There are interfaces to many system calls and libraries, as well as to various windowing systems. …“

In particular, what sets Python apart from other languages is its fantastic
open-source ecosystem for scientific computing and machine learning with
libraries like NumPy, SciPy, scikit-learn and Pytorch.

- Official Python documentation is found here https://www.python.org/doc/ .
- Python forum is found here https://python-forum.io/ .
- A nice introduction to packages can be found here: https://aaltoscicomp.github.io/python-for-scicomp/dependencies/
- CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Ther material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
- The youtube video `Thinking about Concurrency <https://www.youtube.com/watch?v=Bv25Dwe84g0>`_ is a good introduction to writing concurrent programs in Python and the book `High Performance Python <https://www.oreilly.com/library/view/high-performance-python/9781492055013/>`_ is a good resource for ways of speeding up Python code.
    
    - And, if you feel a little unfamiliar to the LINUX world, have a look at the Introduction to UPPMAX course material here: https://www.uppmax.uu.se/support/courses-and-workshops/introductory-course-winter-2022/
    
More python?
------------

- CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Their material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
- General introduction to Python at https://www.uppmax.uu.se/support/courses-and-workshops/introductory-course-summer-2022/

- **This course:** Introduction to HPC (High performance computing) python at UPPMAX and HPC2N in September. 



.. objectives:: 

    We will:
    
    - teach you how to navigate the module system at HPC2N and UPPMAX
    - show you how to find out which versions of Python and packages are installed
    - look at the package handler **pip** (and **Conda** for UPPMAX)
    - explain how to create and use virtual environments
    - show you how to run batch jobs 
    - show some examples with parallel computing and using GPUs
    - guide you in how to start Python tools for Machine Learning
 

