Desktop On-Demand
=================


.. questions::

   - What is Desktop On-Demand?
   - When should I use or not use it?
   - How do I start using it?

   
   
.. objectives:: 

   - Short introduction to Desktop On-Demand
   - Typical setup and usage

    

What is Desktop On-Demand?
--------------------------
At LUNARC (and coming to other HPC centers in the not-too-distant future), Desktop On-Demand provides an interactive environment for submitting single-node programs to SLURM without the typical shell script. It uses the graphical application launcher (GfxLauncher) to submit jobs to SLURM, connect to the application running on the Compute node, and monitor the application's progress. It is not itself an option in the Applications menu; rather, it's the engine that lets you run the listed applications interactively.

Of the coding languages in the course, all but Julia has at least one interactive development environment (IDE) that can be run with Desktop On-Demand. Both Spyder and Jupyter notebooks are available for Python users, R can be used via RStudio, and the standard MATLAB IDE is available for the 3 most recent releases.

Desktop On-Demand requires the use of the Thinlinc interface. It is not accessible via ssh. 


When should I use or not use it?
--------------------------------
Desktop On-Demand is most appropriate for *interactive* work requiring small-to-medium amounts of computing resources. Most applications available with On-Demand can only be set to run on one node, so you are constrained by the resources available to one compute node. For information about the capabilities of each node, you can explore the `LUNARC homepage's Systems tab <https://www.lunarc.lu.se/systems/>`_ and follow the links to your desired resource. (Note: COSMOS-SENS is past the installation phase and is available as a resource; hopefully I can delete this comment before the workshop.)

When you should *not* use Desktop On-Demand:
 - When your job uses multiple nodes,
 - When your job does not require interaction or supervision, or
 - When you need a walltime of more than about half a workday.

Desktop On-Demand puts your resource requests into the same SLURM queue as every other job, so depending on the time and resources you request, you may have to wait a while for your session to start.


How do I start using it?
--------------------------
On the LUNARC HPC Desktop, the Applications menu in the top left corner simply lists all the applications availble to be run interactively, and opening one prefixed by "Applications -" will start it in Desktop On-Demand. There is no specific "Desktop On-Demand" application in the list.

**Please be aware that only the applications in the menu prefixed with "Applications -" are set up to run on the Compute nodes; the rest run on the Login nodes, which have very limited memory.** If you start a terminal session from Favorites or System Tools and launch an interactive program from that, it will run on a Login node, with all the risks that that entails for your user privileges.
