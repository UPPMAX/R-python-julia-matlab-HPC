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

According to the Julia documentation (https://docs.julialang.org/en/v1/)

- Good Base library with efficiently implemented operations written in Julia itself
- "Good performance, approaching that of statically-compiled languages like C"
- Modular and self-contained approach for libraries and development
- "A rich language of types for constructing and describing objects"

Shorcomings of Julia
---------------------

- As this is a new language, the libraries ecosystem is not as rich as in Python or R, for instance
-  
- 
- Official Python documentation is found here https://www.python.org/doc/ .
- Python forum is found here https://python-forum.io/ .
- A nice introduction to packages can be found here: https://aaltoscicomp.github.io/python-for-scicomp/dependencies/
- CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Ther material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
- The youtube video `Thinking about Concurrency <https://www.youtube.com/watch?v=Bv25Dwe84g0>`_ is a good introduction to writing concurrent programs in Python and the book `High Performance Python <https://www.oreilly.com/library/view/high-performance-python/9781492055013/>`_ is a good resource for ways of speeding up Python code.
    
    - And, if you feel a little unfamiliar to the LINUX world, have a look at the Introduction to UPPMAX course material here: https://www.uppmax.uu.se/support/courses-and-workshops/introductory-course-winter-2022/
    
More on Julia?
--------------

- CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Their material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
- General introduction to Python at https://www.uppmax.uu.se/support/courses-and-workshops/introductory-course-summer-2022/

- **This course:** Introduction to HPC (High performance computing) python at UPPMAX and HPC2N in September. 



