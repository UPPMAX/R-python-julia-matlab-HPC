Load and run Julia
===================

.. note::
    
    At the Swedish HPC centers we call the applications available via the module system **modules**:

    - `UPPMAX <https://docs.uppmax.uu.se/cluster_guides/modules/>`_ 
    - `HPC2N <https://www.hpc2n.umu.se/documentation/environment/lmod>`_ 
    - `LUNARC <https://lunarc-documentation.readthedocs.io/en/latest/manual/manual_modules/#hierarchical-naming-scheme-concept>`_

   
.. objectives:: 

   - Learn to load Julia
   - Get started with the Julia command line
   - Learn to run Julia scripts

.. instructor-note::

   - Lecture and demo 15 min
   - Exercise 15 min
   - Total time 30 min

Julia can be started after a Julia module is loaded.
The module activates paths to a specific version of the julia interpreter and its libraries and packages. 

.. admonition:: Short cheat sheet
    :class: dropdown 
    
    - See which modules exists: ``module spider`` or ``ml spider``. 
    - Find module versions for a particular software: ``module spider <software>``
    - Modules depending only on what is currently loaded: ``module avail`` or ``ml av``
    - See which modules are currently loaded: ``module list`` or ``ml``
    - Load a module: ``module load <module>/<version>`` or ``ml <module>/<version>``
    - Unload a module: ``module unload <module>/<version>`` or ``ml -<module>/<version>``
    - Unload all modules except the 'sticky' modules: ``module purge`` or ``ml purge``
    
.. warning::
    Note that the module systems at UPPMAX and HPC2N are slightly different.
    All modules at UPPMAX not directly related to bio-informatics are shown
    by ``ml avail``. 
    Modules at HPC2N are only available when one has loaded all prerequisites,
    for instance the compilers (``GNU``, ``Intel``, etc.).


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

.. admonition:: Output at UPPMAX as of Oct 2024
   :class: dropdown

       .. code-block::  console
    
          $ module avail julia
          ----------------------------- /sw/mf/rackham/compilers -----------------------------
             julia/1.0.5_LTS    julia/1.6.1        julia/1.7.2        julia/1.9.3 (D)
             julia/1.1.1        julia/1.6.3        julia/1.8.5 (L)
             julia/1.4.2        julia/1.6.7_LTS    julia/1.9.1

           Where:
            D:  Default Module

          Use "module spider" to find all possible modules and extensions.
          Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".


.. admonition:: Output at HPC2N as of Oct 2024 
    :class: dropdown

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
                Julia/1.9.3-linux-x86_64
           ------------------------------------------------------------------------------------------------
             For detailed information about a specific "Julia" package (including how to load the modules) use the module's full name.
             Note that names that have a trailing (E) are extensions provided by other modules.
             For example:

                $ module spider Julia/1.8.5-linux-x86_64
           ------------------------------------------------------------------------------------------------

.. admonition:: Output at LUNARC as of Oct 2024 
    :class: dropdown

        .. code-block:: console

           $ module spider julia
           -----------------------------------------------------------------------------------------------------
             Julia:
           -----------------------------------------------------------------------------------------------------
               Description:
                 Julia is a high-level, high-performance dynamic programming language for numerical computing

                Versions:
                   Julia/1.8.5-linux-x86_64
                   Julia/1.9.0-linux-x86_64
                   Julia/1.9.2-linux-x86_64
                   Julia/1.9.3-linux-x86_64
                   Julia/1.10.4-linux-x86_64

           
Load a Julia module
--------------------

For reproducibility, we recommend **ALWAYS** loading a specific module instead of using the default 

For this course, we recommend using the following Julia versions, because the exercises are developed with them:

.. type-along::

   .. tabs::

      .. tab:: UPPMAX
   
         Go back and check which Julia modules were available. To load version 1.8.5, do:

         .. code-block:: console

           $ module load julia/1.8.5
        
         Note: Lowercase ``j``.

         For short, you can also use: 

         .. code-block:: console

            $ ml julia/1.8.5

      .. tab:: HPC2N

         .. code-block:: console

            $ module load Julia/1.9.3-linux-x86_64

         Note: Uppercase ``J``.   

         For short, you can also use: 

         .. code-block:: console

            $ ml Julia/1.9.3-linux-x86_64

Workflow in Julia (DEMO)
------------------------

.. demo::

   The teacher will do this as a demo. You will have the opportunity to test in the next session!

After loading the appropriate modules for Julia, you will have access to the
read-eval-print-loop (REPL) command line by typing ``julia``: 

.. tabs::

   .. tab:: UPPMAX 

        .. code-block:: julia-repl
         
         $ ml julia/1.8.5
         $ julia 

            _       _ _(_)_     |  Documentation: https://docs.julialang.org
           (_)     | (_) (_)    |
            _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
           | | | | | | |/ _` |  |
           | | |_| | | | (_| |  |  Version 1.8.5 (2023-01-08)
          _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
         |__/                   |

         julia> 


   .. tab:: HPC2N

        .. code-block:: julia-repl
         
         $ ml Julia/1.9.3-linux-x86_64
         $ julia 

            _       _ _(_)_     |  Documentation: https://docs.julialang.org
           (_)     | (_) (_)    |
            _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
           | | | | | | |/ _` |  |
           | | |_| | | | (_| |  |  Version 1.9.3 (2023-08-24)
          _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
         |__/                   |

         julia> 

Julia has different modes, the one mentioned above is the so-called ``Julian`` mode
where one can execute commands. The description for accessing these modes will be
given in the following paragraphs. Once you are done with your work in any of the modes,
you can return to the ``Julian`` mode by pressing the ``backspace`` key.

While being on the Julian mode you can enter the ``shell`` mode by typing ``;``:

.. code-block:: julia

   julia>; 
   shell>pwd
   /current-folder-path

this will allow you to use Linux commands. Notice that the availability of these commands
depend on the OS, for instance, on Windows it will depend on the terminal that you have
installed and if it is visible to the Julia installation. 

Another mode available in Julia is the ``package manager`` mode, it can be accessed by typing 
``]`` in the ``Julian`` mode:

.. code-block:: julia-repl

   julia>]
   (v1.9) pkg>

this will make your interaction with the package manager **Pkg** easier, for instance,
instead of typing the complete name of **Pkg** commands such as ``Pkg.status()`` in the
``Julian`` mode, you can just type ``status`` in the ``package`` mode. 

The last mode is the ``help`` mode, you can enter this mode from the ``Julian`` one by
typing ``?``, then you may type some string from which you need more information:

.. code-block:: julia

   julia>?

   help?> ans
   search: ans transpose transcode contains expanduser instances MathConstants readlines 
   LinearIndices leading_ones leading_zeros

   ans

   A variable referring to the last computed value, automatically set at the interactive prompt.


More detailed information about the modes in Julia can be found `here <https://docs.julialang.org/en/v1/stdlib/REPL/>`_.

Run
---

Run Julia script
################

You can run a Julia script in the shell like this:

.. code-block:: console

   $ julia example.jl
    
Run Julia as a session
######################

.. admonition:: The Julian modes summary
   :class: dropdown

    - enter the shell mode by typing ``;``
    - go back to *Julian* mode by ``<backspace>``
    - access the package manager mode by typing ``]`` in the *Julian* mode
    - use the help mode by typing ``?`` in the *Julian mode*

.. type-along::

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


.. challenge:: 1. Getting familiar with Julia REPL
    
    - It is important in this course that you know how to navigate on the Julia command line. Here is where you install packages.
    - This exercise will help you to become more familiar with the REPL. Do the following steps: 

       * Start a Julia session. In the ``Julian`` mode, compute the sum the numbers 
         5 and 6
       * Change to the ``shell`` mode and display the current directory
       * Now, go to the ``package`` mode and list the currently installed packages
       * Finally, display help information of the function ``println`` in ``help`` mode.

.. solution:: Solution for centres
    :class: dropdown

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

            .. code-block:: julia

                x = parse( Int32, ARGS[1] )
                y = parse( Int32, ARGS[2] )
                summ = x + y
                println("The sum of the two numbers is ", summ)

.. solution:: Solution for HPC2N
   :class: dropdown
   
      This batch script is for Kebnekaise. 

      
      .. code-block:: console

            $ ml purge  > /dev/null 2>&1       # recommended purge
            $ ml Julia/1.9.3-linux-x86_64      # Julia module
                  
            $ julia serial-sum.jl Arg1 Arg2    # run the serial script

.. solution:: Solution for UPPMAX
   :class: dropdown
   
      This batch script is for UPPMAX. Adding the numbers 2 and 3. (FIX)

      .. code-block:: console

            $ ml julia/1.8.5                   # Julia module
         
            julia serial-sum.jl Arg1 Arg2      # run the serial script


.. Discussion:: **Menti**

   - Can you start Julia without loading a Julia module?
   - How do you activate Julia packages in the Julia REPL? 
   - How do you toggle to the package mode? 

.. keypoints::

   - Before you can run Julia scripts or work in a Julia shell, first load a Julia module
   - Start a Julia shell session with ``julia``
   - It offers several modes that can make your workflow easier, i.e., ``Julian``, 
     ``shell``, ``package manager``, and ``help`` modes.
   - Run scripts with ``julia <script.jl>``
    
