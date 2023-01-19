Introduction Julia
==================

`Welcome page and syllabus <https://uppmax.github.io/HPC-python/index.html>`_
   - Also link at House symbol |:house:| at top of page 

.. admonition:: **Learning outcomes**
   
   - Load Julia modules and site-installed Julia packages
   - Create a Julia environment
   - Install Julia packages with **Pkg**
   - Write a batchscript for running Julia
   - Use Julia in parallel mode
   - Use Julia for ML
   - Use GPUs with Julia
   

What is Julia?
--------------

Julia is a relatively new Programming language (pre-released 1.0 announced in
2012) compared to well-known and standard languages such as Fortran, C, C++, R,
and Python (some of them dated back to the 70's). A common pattern in those
well-stablished languages (traditional paradigm) is that they look after either 
productivity (fast deployment, fast prototyping) or performance (fast numerical 
computations). 

This pattern created the so called **two-language problem** where programmers
had to choose between productivity (R, Python) or performance (Fortran, C/C++)
and when both were needed programmers had to learn the language that offered 
the desired capability and use some interface between different languages.

Among the different features of Julia, is its capability of integrating
both aspects productivity and performance into a single language. In this way,
Julia programmers can in principle write software without changing their
focus to learn a new language. 


.. figure:: ../../img/two-language.png
   :width: 300
   :align: center

   Two-language problem where Julia is shown as a bridge between the languages
   in the traditional paradigm. 

Features of Julia
-----------------

According to the Julia documentation (https://docs.julialang.org/en/v1/) some of
the features of this language are:

- Good Base library with efficiently implemented operations written in Julia itself
- "Good performance, approaching that of statically-compiled languages like C"
- Modular and self-contained approach for libraries and development
- "A rich language of types for constructing and describing objects"
- A fast growing community of users and developers

Shorcomings of Julia
--------------------

- As this is a new language, the libraries ecosystem is not as rich as in Python or R, for instance
- Currently, using Julia for simple tasks (for instance, opening a file and writing text, plotting) is not as
  efficient as using Linux tools (AWK, GREP) or compiled languages (Fortran, C/C++, Rust)
- Previous situation is more noticeable upon running simple tasks in parallel mode (MPI, Threads)
  

More on Julia?
--------------

- Documentation at the HPC centres UPPMAx and HPC2N
   - UPPMAX: https://www.uppmax.uu.se/support/user-guides/python-user-guide/
   - HPC2N: https://www.hpc2n.umu.se/resources/software/julia
- Official Julia documentation is found here: https://docs.julialang.org/en/v1/
- Slack channel for Julia and instructions for joining it are found here: https://julialang.org/slack/
- Julia for High Performance Computing course material from ENCCS: https://enccs.github.io/Julia-for-HPC/
- HPC2N YouTube video on Julia in HPC: https://www.youtube.com/watch?v=bXHe7Kj3Xxg




