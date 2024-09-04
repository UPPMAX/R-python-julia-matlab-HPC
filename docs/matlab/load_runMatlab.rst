Load and Run MATLAB
===================

Different recommended procedures for each HPC center:
  - **UPPMAX and HPC2N**: use module system to load at command line
  - **LUNARC**: recommended to use Desktop On-Demand menu, but interactive command line available

Most HPC centres in Sweden is using the same or similar module system for their software. The difference lies in which modules are installed and their versions/naming. The general examples below will be the same for all/most HPC centres in Sweden - the specific names for the modules will vary a little.
   
.. objectives:: 

   - Show how to load Matlab
   - Show how to run Matlab scripts and start the Matlab user interface

.. admonition:: Short cheat sheet
    :class: dropdown 
    
    - See which modules exists: ``module spider`` or ``ml spider``
    - Find module versions for a particular software: ``module spider <software>``
    - Modules depending only on what is currently loaded: ``module avail`` or ``ml av``
    - See which modules are currently loaded: ``module list`` or ``ml``
    - Load a module: ``module load <module>/<version>`` or ``ml <module>/<version>``
    - Unload a module: ``module unload <module>/<version>`` or ``ml -<module>/<version>``
    - More information about a module: ``module show <module>/<version>`` or ``ml show <module>/<version>``
    - Unload all modules except the 'sticky' modules: ``module purge`` or ``ml purge``
    
.. warning::
   
   - Note that the module systems at UPPMAX, HPC2N, and LUNARC are slightly different. 
   - While all modules at UPPMAX not directly related to bio-informatics are shown by ``ml avail``, modules at HPC2N and LUNARC may be hidden until one has loaded a prerequisite like the compiler ``GCC``.
   - Thus, you need to use ``module spider`` to see all modules at HPC2N and LUNARC, and ``ml avail`` for those available to load given your currently loaded prerequisites.  
   - There is no system MATLAB that comes preloaded like Python, but `ml load matlab` with no release date will load the latest release, which is periodically updated. For reproducibility reasons, you should be sure to load the same release throughout a given project.

Check for MATLAB versions
-------------------------

.. type-along::
   
   Checking for MATLAB versions 
   
   .. tabs::

      .. tab:: UPPMAX

         Check all available MATLAB versions with:

         .. code-block:: console

            $ module avail matlab


      .. tab:: HPC2N
   
         Check all available version MATLAB versions with:

         .. code-block:: console
 
            $ module spider matlab
      
         To see how to load a specific version of MATLAB, including the prerequisites, do 

         .. code-block:: console
   
            $ module spider matlab/<version>

         Example for MATLAB R2023b 

         .. code-block:: console

            $ module spider matlab/2023b 


      .. tab:: LUNARC

         See all available MATLAB versions at the command line with:

         .. code-block:: console

            $ ml spider matlab

         Or, if on Desktop On-Demand, select Applications in the top left corner and hover over `Applications - Matlab`

.. note::
  
  In this course we will use MATLAB R2023b.

.. admonition:: Output at LUNARC (Cosmos nodes) as of 4 Sep 2024  
    :class: dropdown

        .. code-block:: console

           $ ml spider matlab
        ----------------------------------------------------------------------------
          matlab:
        ----------------------------------------------------------------------------
             Versions:
                matlab/2022a
                matlab/2023a
                matlab/2023b
        
        ----------------------------------------------------------------------------
          For detailed information about a specific "matlab" package (including how to l
        oad the modules) use the module's full name.
          Note that names that have a trailing (E) are extensions provided by other modu
        les.
          For example:
        
             $ module spider matlab/2023b
        ----------------------------------------------------------------------------


Load a MATLAB module
--------------------

For reproducibility, we recommend ALWAYS loading a specific module instead of using the default version! 

For this course, we recommend using MATLAB R2023x at UPPMAX (2023?), LUNARC (2023b), and HPC2N (2023?).

.. type-along::
    
   Loading a Matlab module at the command line, here R2023b

   .. tabs::

      .. tab:: UPPMAX and LUNARC
   
         Go back and check which MATLAB modules were available. To load version 2023b, do:

         .. code-block:: console

            $ module load matlab/2023b
        
         Note: all lowercase.
         For short, you can also use: 

         .. code-block:: console

            $ ml matlab/2023b

 
      .. tab:: HPC2N 

         .. code-block:: console

            $ module load MATLAB/2023B

         Note: all Uppercase except for the letter after the year.   
         For short, you can also use: 

         .. code-block:: console

            $ ml MATLAB/2023b
