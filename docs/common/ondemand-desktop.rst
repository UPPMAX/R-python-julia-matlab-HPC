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

Of the coding languages in the course, all but Julia has at least one interactive development environment (IDE) that can be run with Desktop On-Demand: Both Spyder and Jupyter notebooks are available for Python users, R can be used via one of a couple releases of RStudio, and the standard MATLAB IDE is available for the 3 most recent releases. Other applications not explicitly listed but that can be launched from an Interactive Terminal or Acclerated Terminal session.

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
On the LUNARC HPC Desktop, the Applications menu lists all the applications availble to be run interactively, and opening one prefixed by "Applications -" will start it in Desktop On-Demand. There is no specific "Desktop On-Demand" application in the list. Most common IDEs can be found in a drop-down menu that appears when you hover over ``Applications - <Language>`` for your language of choice, but more niche packages may be listed under a subject-matter field instead, like ``Applications - Engineering``. If you don't see the program you want to run interactively listed under any other ``Applications`` sub-menus, you may still be able to launch it via the **Interactive Terminal** (CPU only) under ``Applications - General``, or the **Accelerated Terminal** (GPU support) under ``Applications - Visualization``.  

**Please be aware that only the applications in the menus prefixed with "Applications -" are set up to run on the Compute nodes.** If you start a terminal session from Favorites or System Tools and launch an interactive program from that, it will run on a Login node, with all the risks that that entails for your user privileges.

For most programs, the start-up process is roughly the same:

#. Log into COSMOS via Thinlinc to start a LUNARC HPC Desktop session.
#. Click ``Applications`` in the top left corner and hover over the items prefixed with ``Applications -`` until you find your desired application.
#. Upon clicking your chosen application, a pop-up, the Gfx Launcher interface, will appear and let you set the following options:
      #. **Walltime** - how long your interactive session will remain open. When it ends, the whole window closes immediately and any unsaved work is lost. You can select the time from a drop-down menu, or type in a number of minutes or hours manually, as long as that number does not exceed 48 hours. Default is 30 minutes.
      #. **Requirements** - how many tasks per node you need. The default is usually 1 or 4 tasks per node. There is also a gear icon to the right of this box that can pull up a second menu where you can set the name of your job, the amount of memory per CPU core, and/or toggle whether or not to use a full node.
      #. **Resource** - which kind of node you want in terms of the architecture (AMD or Intel) and number of cores in the CPU (or GPU, if you choose the Accelerated Terminal). For most programs, you only have 2 choices: one AMD option and one Intel option.
      #. **Project** - choose from a drop-down menu the project with which your work is associated. This is mainly to keep your usage in line with your licenses and permissions, and to send any applicable invoices to the correct PI. Licensed software will only work for projects whose group members are covered by the license.
#. When you're happy with your settings, click "Start". The Gfx Launcher menu will stay open in the background so that you can monitor your remaining time and resources with the ``Usage`` bar.

If you want, you can also look at the associated SLURM scripts by clicking the "More" button at the bottom of the Gfx Launcher menu and clicking the "Script" tab, or view the logs under the "Logg" tab.
