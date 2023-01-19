.. R-python-julia-HPC documentation master file, created by
   sphinx-quickstart on Fri Jan 21 18:24:04 2022.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.
   
Welcome to Introduction to running R, Python, and Julia in HPC
==============================================================

.. admonition:: This material
   
   Here you will find the content of the workshop Using Python in an HPC environment.
   
   - Documentation at the HPC centres UPPMAx and HPC2N
      - UPPMAX: https://www.uppmax.uu.se/support/user-guides/python-user-guide/
      - HPC2N: https://www.hpc2n.umu.se/resources/software/user_installed/python


.. admonition:: Content

   - This course aims to give a brief, but comprehensive introduction to using Python in an HPC environment.
   - You will learn how to
      - use modules to load Python
      - find site installed Python packages
      - install packages yourself
      - use virtual environments, 
      - write a batch script for running Python
      - use Python in parallel
      - how to use Python for ML and on GPUs. 
   - This course will consist of lectures interspersed with hands-on sessions where you get to try out what you have just learned.    


.. admonition:: Cluster-specific approaches

   - The course is a cooperation between UPPMAX (Rackham, Snowy, Bianca) and HPC2N (Kebnekaise) and will focus on the compute systems at both centres. 
   - For the site-specific part of the course you will be divided into groups depending on which center you will be running your code, as the approach is somewhat different. 


Preliminary schedule
====================

.. list-table:: Preliminary schedule
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Activity
   * - 9:00
     - Syllabus 
     -
   * - 
     - Introduction 
     - Lecture
   * - 
     - Loading modules and running Python codes 
     - Lecture+code along
   * - 
     - Dealing with packages  
     - Lecture+code along
   * - 
     - **Coffee**
     - 
   * - 
     - Isolated environments (general)
     - Lecture+code along
   * - 
     - SLURM Batch scripts for Python jobs  
     - Lecture+code along + exercise
   * - 
     - Interactive
     - Lecture+code along
   * - 
     - **Short leg stretch**
     - 
   * - 
     - Separated sessions 1 for UPPMAX/HPC2N:isolated environments
     - Lecture
   * - 12:00
     - LUNCH 
     -
   * - 13:00
     - Parallelising a simple Python code  
     - Lecture+code along + exercise
   * - 
     - Deploying GPU:s for Python
     - Lecture+code along + exercise
   * - 
     - **Short leg stretch**
     - 
   * - 
     - Using Python for Machine Learning jobs
     - Lecture+code along
   * - 
     - Separated sessions 2 for UPPMAX/HPC2N: Bianca/ML exercises
     - Lecture
   * - 
     - **Coffee**
     - 
   * - 
     - Summary 
     -
   * - 
     - Q&A on-demand
     -
   * - 
     - Additional exercises 
     -
   * - 16.00
     - END
     -
    

.. toctree::
   :maxdepth: 2
   :caption: Python Lessons:

   python/introPython.rst
   python/load_runPython.rst
   python/packagesPython.rst
   python/isolatedPython.rst
   python/isolatedUPPMAXPython.rst
   python/isolatedHPC2NPython.rst
   python/batchPython.md
   python/interactivePython.md
   python/uppmaxPython.rst
   python/conda.rst
   python/jupyterUPPMAX.md
   python/kebnekaisePython.md

 
.. toctree::
   :maxdepth: 2
   :caption: julia Lessons:

   julia/introJulia.rst
   julia/load_runPython.rst
   julia/packagesPython.rst
   julia/isolatedPython.rst
   julia/isolatedUPPMAXPython.rst
   julia/isolatedHPC2NPython.rst
   julia/batchPython.md
   julia/interactivePython.md
   julia/uppmaxPython.rst
   julia/jupyterUPPMAX.md
   julia/kebnekaisePython.md
   
.. toctree::
   :maxdepth: 2
   :caption: R Lessons:

   R/intro.rst
   R/load_runPython.rst
   R/packagesPython.rst
   R/isolatedPython.rst
   R/isolatedUPPMAXPython.rst
   R/isolatedHPC2NPython.rst
   R/batchPython.md
   R/interactivePython.md
   R/uppmaxPython.rst
   R/kebnekaisePython.md


Some practicals
---------------

.. warning:: Course has already been given (TOFIX)

   - Q/A are public at the HackMD pages
      - https://hackmd.io/@bclaremar/HPC-python
      - https://hackmd.io/IoseeprATrWH0ZI7z6wJ-w?view
   
   



.. admonition:: Zoom

    - The course is run over Zoom. You should have gotten an email with the links
        
    - There will be a zoom for the lectures, a zoom for the HPC2N sessions, and a zoom for the UPPMAX sessions. 
        - The exercises will be done in the separate sessions.
   
    - When you join the Zoom meeting, use your REAL NAME.
    
    - The lectures and demos will be recorded, but NOT the exercises. If you ask questions during the lectures, you may thus be recorded. If you do not wish to be recorded, then please keep your microphone muted and your camera off during lectures and write your questions in the Q/A document (see below about HackMD collaboration document).
    
    - Please MUTE your microphone when you are not speaking and use the “Raise hand” functionality under the “Participants” window during the lecture. Please do not clutter the Zoom chat. Behave politely!

    - There may be breakout rooms used in the Zoom for the hands-ons. You will be randomly assigned to one of them.  
    
    
.. admonition:: Collabration document HackMD (TOFIX)

    - Use the HackMD page for the workshop with your questions.
        - https://hackmd.io/@bclaremar/HPC-python

    - Depending on how many helpers there are we'll see how fast there are answers. 
        - Some answers may come after the workshop.
 
    - Type in the left frame 
        - "-" means new bullet and <tab> indents the level.
        - don't focus too much on the formatting if you are new to "Markdown" language!
    
    - **Have a try with the Icebreaker question**

.. admonition:: Exercises (TOFIX)

    - You can download the exercises from the course GitHub repo, under the "Exercises" directory: https://github.com/UPPMAX/HPC-python/tree/main/Exercises 
    - On HPC2N, you can copy the exercises in a tarball from ``/proj/nobackup/snic2022-22-641/bbrydsoe/examples.tar.gz``
    - On UPPMAX you can copy the exercises in a tarball from ``/proj/snic2022-22-641/nobackup/examples.tar.gz``
    
.. admonition:: **Your expectations?**
   
    - find best practices for using Julia at UPPMAX and HPC2N
    - packages
    - use the HPC performance with Julia

    
    **Not covered**
    
    - improve Julia *coding* skills 
    - Other clusters


.. warning::

    - It is good to have a familiarity with the LINUX command line. 
    - Short introductions : https://uppsala.instructure.com/courses/67267/pages/using-the-command-line-bash?module_item_id=455632
    - Linux "cheat sheet": https://www.hpc2n.umu.se/documentation/guides/linux-cheat-sheet
    - UPPMAX software library: https://uppsala.instructure.com/courses/67267/pages/uppmax-basics-software?module_item_id=455641
    - Whole intro course material (UPPMAX): https://www.uppmax.uu.se/support/courses-and-workshops/introductory-course-winter-2022/
    - HPC2N's intro course material (including link to recordings): https://github.com/hpc2n/intro-course
    - HPC2N's YouTube channel video on Linux: https://www.youtube.com/watch?v=gq4Dvt2LeDg

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
     
         /proj/nobackup/snic2022-22-641/bbrydsoe/pythonHPC2N (TOFIX)
         
.. admonition:: Use Thinlinc or terminal?

   - It is up to you!
   - Graphics come easier with Thinlinc
   - For this course, when having many windows open, it may be better to run in terminal, for space issues.
   
   
Example of arrangement for the "worst case"!
############################################
- HackMD
- ZOOM view
- (shellshare) or web browser with course material
- your own terminal

.. figure:: ../img/worst.jpg
   :align: center


.. Indices and tables
.. ==================

.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`
