Load and run Julia
===================

[RB: All my feedback is added like this: between square brackets
and starting with ``RB:``.

Feel free to ignore all this. The goal is to make one consider or
reconsider, not bluntly accepting other's (potentially worse!) ideas.

I enjoy to see the attempt of having a focus in the material:
compared to earlier work, this is definitely more focused, well done!
I think my comments will help focus it even more :-). ]

.. Discussion:: **Menti**

   - What would you like to use Julia for? [RB: Suggest to remove or move to 
     introduction: it this does not match the objectives below]
   - What do you want to learn today? [RB: Suggest to remove or move to 
     introduction: it this does not match the objectives below]

.. note::

    
    At both UPPMAX and HPC2N we call the applications available via the module system modules:

    - https://www.uppmax.uu.se/resources/software/module-system/ 
    - https://www.hpc2n.umu.se/documentation/environment/lmod 

   
.. objectives:: 

    [RB: It is really the objectives to show things? Shouldn't the objectives
    be 'Load Julia', 'Start and use the Julia command line' and 'Run a
    Julia script'? Now a YouTube video is enough]

   - Show how to load Julia
   - show how to start and use the Julia command line
   - Show how to run Julia scripts and 

.. instructor-note::

    [RB: This is quite short, I suggest 5 mins of lecture and 25 mins of 
    exercise. Asking 45 mins for this sessions seems more reasonable to me,
    with 5 mins lecture, 35 mins exercise and 5 mins discussion]

   - Lecture and demo 15 min
   - Exercise 15 min
   - Total time 30 min



As for Python, [RB: suggest delete 'As for Python', as this is about Julia. Not
all learners know Python]
Julia can be started after a Julia module is loaded.
The module activates paths to a specific version of the julia interpreter and its libraries and packages. 

.. admonition:: Short cheat sheet
    :class: dropdown 
    
    - See which modules exists: ``module spider`` or ``ml spider``. 
      [RB: suggest showing only the readable form ``module spider``, the other
      form only makes one come accross as smug. The teaching goal is not to look
      like a smartass when using the module system :-) ]
    - Find module versions for a particular software: ``module spider <software>``
    - Modules depending only on what is currently loaded: ``module avail`` or ``ml av``
      [RB: suggest showing only the readable form ``module avail``, the other
      form only makes one come accross as smug. The teaching goal is not to look
      like a smartass when using the module system :-) ]
    - See which modules are currently loaded: ``module list`` or ``ml``
      [RB: suggest showing only the readable form ``module list``, the other
      form only makes one come accross as smug. The teaching goal is not to look
      like a smartass when using the module system :-) ]
    - Load a module: ``module load <module>/<version>`` or ``ml <module>/<version>``
    - Unload a module: ``module unload <module>/<version>`` or ``ml -<module>/<version>``
      [RB: suggest showing only the readable form ``module unload``, the other
      form only makes one come accross as smug. The teaching goal is not to look
      like a smartass when using the module system :-) ]
    - More information about a module: ``module show <module>/<version>`` or ``ml show <module>/<version>``
      [RB: suggest to remove this: teachin goal is about starting Julia, not
      to be good with modules]
    - Unload all modules except the 'sticky' modules: ``module purge`` or ``ml purge``
      [RB: suggest to remove this: the teaching goal is about starting Julia, not
      to be good with modules]
    
.. warning::
    Note that the module systems at UPPMAX and HPC2N are slightly different.
    While all modules at UPPMAX not directly related to bio-informatics are shown
    by ``ml avail``
   [RB: suggest showing only the readable form ``module avail``, the other
   form only makes one come accross as smug. The teaching goal is not to look
   like a smartass when using the module system :-) ],
   modules at HPC2N are hidden until one has loaded a prerequisite
   like the compiler ``GCC``.

- For reproducibility reasons, you should always load a specific version of a
  module instead of just the default version (often the latest)
  [RB: suggest to remove this: the teaching goal is about starting Julia, not
  to do reproducible research. Or explain at the section about loading modules
  why one could consider to add a version number]

Check for Julia versions
-------------------------


.. tabs::

   .. tab:: UPPMAX

     Check all available Julia versions with:

      .. code-block:: console

          $ module avail julia


   .. tab:: HPC2N
   
      Check all available version Julia versions with:

      .. code-block:: console
 
         $ module spider julia
      
      To see how to load a specific version of Julia, including the prerequisites, do 

      .. code-block:: console
   
         $ module spider Julia/<version>

      Example for Julia 1.8.5

      .. code-block:: console

         $ module spider Julia/1.8.5

.. admonition:: Output at UPPMAX as of Feb 29 2024
   :class: dropdown

       [RB: suggest to remove the date, or putting this is a comment.
       The date is irrelevant for learners and does not achieve the sessions
       goals. Nor is this session about the history of the module system]
    
       .. code-block::  console
    
          $ module av julia
          ----------------------------- /sw/mf/rackham/compilers -----------------------------
             julia/1.0.5_LTS    julia/1.6.1        julia/1.7.2        julia/1.9.3 (D)
             julia/1.1.1        julia/1.6.3        julia/1.8.5 (L)
             julia/1.4.2        julia/1.6.7_LTS    julia/1.9.1

           Where:
            D:  Default Module

          Use "module spider" to find all possible modules and extensions.
          Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".


.. admonition:: Output at HPC2N as of Feb 29 2024
    :class: dropdown

       [RB: suggest to remove the date, or putting this is a comment.
       The date is irrelevant for learners and does not achieve the sessions
       goals. Nor is this session about the history of the module system]

        .. code-block:: console

           $ module spider julia
           ------------------------------------------------------------------------------------------------
             Julia:
           ------------------------------------------------------------------------------------------------
             Description:
               Julia is a high-level, high-performance dynamic programming language for numerical
               computing

             Versions:
                Julia/1.5.3-linux-x86_64
                Julia/1.7.1-linux-x86_64
                Julia/1.8.5-linux-x86_64

           ------------------------------------------------------------------------------------------------
             For detailed information about a specific "Julia" package (including how to load the modules) use the module's full name.
             Note that names that have a trailing (E) are extensions provided by other modules.
             For example:

                $ module spider Julia/1.8.5-linux-x86_64
           ------------------------------------------------------------------------------------------------


Load a Julia module
--------------------

For reproducibility, we recommend ALWAYS loading a specific module instead of using the default version! 
[RB: suggest to remove this: the teaching goal is about starting Julia, not
to do reproducible research. Or explain at the section about loading modules
why one could consider to add a version number]

For this course, we recommend using Julia 1.8.5.
[RB: here one could add something like: 'We use a specific version of Julia, as
this allows for reproducible research']

.. type-along::

   .. tabs::

      .. tab:: UPPMAX
   
         Go back and check which Julia modules were available. To load version 1.8.5, do:

         .. code-block:: console

           $ module load julia/1.8.5
        
         Note: Lowercase ``j``.

         [RB: suggest showing only the readable form ``module load``, the other
         form only makes one come accross as smug. The teaching goal is not to look
         like a smartass when using the module system :-) ]

         For short, you can also use: 

         .. code-block:: console

            $ ml julia/1.8.5

 
      .. tab:: HPC2N

         .. code-block:: console

            $ module load Julia/1.8.5-linux-x86_64

         Note: Uppercase ``J``.   

         [RB: suggest showing only the readable form ``module load``, the other
         form only makes one come accross as smug. The teaching goal is not to look
         like a smartass when using the module system :-) ]

         For short, you can also use: 

         .. code-block:: console

            $ ml Julia/1.8.5-linux-x86_64

Run
---

Run Julia script
################

You can run a Julia script in the shell like this:

.. code-block:: console

   $ julia example.jl
    
More information will follow later in the course on running Julia from within a **batch job**. 
[RB: suggest to remove here. In this section, now, we'll be running a Julia
script. Maybe in the introduction, maybe later in this sessions we'll discuss
the problem of running Julia on a login node. Still, I would suggest to
remove this]

Run Julia as a session
######################

.. admonition:: The Julian modes

  - enter the shell mode by typing ``;``
  - go back to *Julian* mode by ``<backspace>``
  - enter the package manager mode by typing ``]`` in the *Julian* mode
  - enter the help mode by typing ``?`` in the *Julian mode*

.. type-along::

   [RB: suggest to replace a type-along by an exercise, optionally
   with a video (maybe the video of the previous iteration?).
   The literature is
   mixed wether a type-along is a passive or an active form of teaching.
   For sure, a type-along requires learners to do two things at the same
   time: maybe that is a bad enough idea of itself]

   .. code-block:: console

      $ julia 

   The Julia prompt (``julian`` mode) looks like this:

   .. code-block:: julia-repl
   
      julia> 

   Exit with 

   .. code-block:: julia-repl

      julia> <Ctrl-D> 

   or 

   .. code-block:: julia-repl

      julia> exit()

Exercises
---------

[RB: suggest to add another exercise to load the modules to load
Julia. This can go as shallow as only doing ``module load julia``
and maybe this indeed all that needs to be known about the module system:
the teaching goal is loading and running Julia, not becoming an lmod
wizard. Whatever lmod commands are used in this exercise, only keep
those in this session's content]

.. challenge:: 1. Getting familiar with Julia REPL
    
    It is important in this course that you know how to navigate on the 
    Julia command line. 
    [RB: Why is this important?]
    This exercise will help you to become more familiar
    with the REPL. Do the following steps: 

       * Start a Julia session. In the ``Julian`` mode, compute the sum the numbers 
         5 and 6
       * Change to the ``shell`` mode and display the current directory
       * Now, go to the ``package`` mode and list the currently installed packages
       * Finally, display help information of the function ``println`` in ``help`` mode.

    .. solution:: Solution for centres
        :class: dropdown

            [RB: these answers are new information. Either add these commands
            to the session's content or link to some online Julia book
            or something: learners cannot possibly know the answers from
            doing everything on this page]
            
            .. code-block:: julia
    
                $ julia 
                julia> 5 + 6
                julia>;
                shell> pwd 
                julia>]
                pkg> status 
                julia>?
                help?> println

.. challenge:: 2. Loading modules and running scripts
    
    Load the Julia version 1.8.5 and run the following serial script (``serial-sum.jl``) which accepts two integer arguments as input: 

            [RB: add the answer on how to load Julia with the module system] 

            [RB: taking a look at the Julia style guide at 
            https://docs.julialang.org/en/v1/manual/style-guide/, the code
            below does not seems to follow it. I suggest to show code that
            does follow a style guide. On the other hand, it has nothing to
            do with the learning objective, but showing code in bad style
            makes us teachers look bad]

            .. code-block:: julia

                x = parse( Int32, ARGS[1] )
                y = parse( Int32, ARGS[2] )
                summ = x + y
                println("The sum of the two numbers is ", summ)

    .. solution:: Solution for HPC2N
        :class: dropdown
        
            This batch script is for Kebnekaise. 

            [RB: suggest to remove the purge, as this has nothing to do
            with the teaching goals] 
            [RB: suggest to use ``module load`` over looking smug] 
            [RB: suggest to use numbers instead of Arg1 and Arg2,
            e.g. 42 and 314, so that the answer actually is an answer] 
            
            .. code-block:: console
    
                $ ml purge  > /dev/null 2>&1       # recommended purge
                $ ml Julia/1.8.5-linux-x86_64      # Julia module
                        
                $ julia serial-sum.jl Arg1 Arg2    # run the serial script

    .. solution:: Solution for UPPMAX
        :class: dropdown
        
            This batch script is for UPPMAX. Adding the numbers 2 and 3. (FIX)

            [RB: suggest to use ``module load`` over looking smug] 

            [RB: suggest to use numbers instead of Arg1 and Arg2,
            e.g. 42 and 314, so that the answer actually is an answer] 
            
            .. code-block:: console
   
                $ ml julia/1.8.5      # Julia module
               
                julia serial-sum.jl Arg1 Arg2    # run the serial script


.. Discussion:: **Menti**

   - Can you start Julia without loading a Julia module?
   - How do you activate Julia packages in the Julia REPL? [RB: this is new
     info to the learners, probably this is in the next session?]
   - How do you toggle to the package mode? [RB: this is the course
     content and it is a simple answer unsuitable for a discussion.
     Sure, one can do a poll with 'Who can do X?' and 'Who can do Y?',
     but that is not a discussion. Discuss more complex things instead, like,
     indeed, 'Can you start Julia without loading a Julia module?']

.. keypoints::

   - Before you can run Julia scripts or work in a Julia shell, first load a Julia module
   - Start a Julia shell session with ``julia``
   - Run scripts with ``julia <script.jl>``
    