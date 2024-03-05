Pre-requirements
================

Technical on local computer
---------------------------

- We recommend that you set up both:

    - a terminal on you computer that can handle X11 graphics AND 
    - install the "Remote Access Desktop application" ThinLinc, see below.


Basic terminal clients 
#######################

**If you are in a hurry or get problems in the installation procedure you can do most of the work from these first steps.**

.. tabs::

   .. tab:: Mac

      - Use terminal (e.g. from Launchpad) or `iTerm2 <https://iterm2.com/>`_

      .. figure:: img/Mac_terminal.png
         :width: 550
         :align: center

         Mac built-in terminal

      - iTerm2 goodies:
         - You can save hosts for later.
         - Drag and drop scp


   .. tab:: Windows

      - the ssh (secure shell) client `putty<https://www.putty.org/>`_ is sufficient first days of the course!

         - You can save hosts for later.
         - No graphics.
      
      .. figure:: ./img/putty.jpg

         :width: 550
         :align: center

         Putty built-in terminal

      - Windows Powershell terminal can also work

         - Cannot save hosts
         - no graphics
         - `PowerShell <https://learn.microsoft.com/en-us/powershell/>`_
    
      - Windows command prompt can also work

         - Cannot save hosts
         - no graphics
         - `Command Prompt <https://www.makeuseof.com/tag/a-beginners-guide-to-the-windows-command-line/>`_

      - `Git bash <https://gitforwindows.org/>`_

Add X11 graphics to terminal
############################

.. tabs::

   .. tab:: Mac

      - Download and install **XQuartz** or other X11 server for Mac OS
         - https://www.xquartz.org

      - Start terminal (e.g. from Launchpad) or `iTerm2 <https://iterm2.com/>`_ 

   .. tab:: Windows

      - Install `MobaXterm <https://mobaxterm.mobatek.net/>`_  with built-in X11 and sftp file manager
         - sftp frame makes it easy to move, upload and download files.
         - ... though downloading from remote host to local is usually easier.
         - tabs for several sessions

      .. figure:: ./img/mobax.jpg

      - Start local terminal and a SSH session by:

      .. codeblock:: console

         $ ssh -Y <username>@rackham.uppmax.uu.se

      .. figure:: ./img/mobax_start1.jpg

      - Or even better, create and save a SSH session, as shown in image below.
          - This allows you to use MobaXterm as a file manager and  to use the built-in graphical texteditor.
          - You can rename the session in the Bookmark settings tab.

      .. figure:: ./img/mobax_start.jpg




.. admonition:: X11-forwarding from the command line (generally)

   - Graphics can be sent through the SSH connection you’re using to connect
      - Use primarily `ssh -Y <...>` and secondary `ssh -X <...>`

   - The X servers that enables graphics are needed, as mentioned above!
      - When starting a graphical program, a new window will open, but your terminal will be “locked”.
      - Run using "`&`" at the end to run it as a background process e.g. "`xeyes &`" or “`gedit &`”

    .. figure:: ./img/xeyes.png

    - Alternatively, use `<ctrl>-z` to put e.g. gedit to sleep and type "`bg`" to make last process in background.

ThinLinc
########

- Rackham, Kebnekaise and Bianca offer graphical login.
- This gives you a desktop environment, as if you were working on your own computer!
- Install ThinLinc cient
     - https://www.cendio.com/thinlinc/download

- Login to ThinLinc desktop application by providing the following

.. tabs::

   .. tab:: Rackham

      - server: rackham-gui.uppmax.uu.se

      - username

      - password
 
   .. tab:: Kebnekaise

      - server: kebnekaise-tl.hpc2n.umu.se

      - username

      - password

.. figure:: ./img/Thinlinc2.jpg



Try to log in
#############

- Follow the steps in the emailed instructions.
- First time you need to use a terminal to set password
- When password is set you can begin to use ThinLinc as well.

- When logging in the first time in ThinLinc, choose XFCE desktop. 

- Test it!

.. seealso::

   `Log in to Rackham <http://docs.uppmax.uu.se/getting_started/login_rackham/>`_ 

.. keypoints::

   - When you log in from your local computer you will always arrive at a login node with limited resources. 
       - You reach the calculations nodes from within the login node (See  Submitting jobs section)
   - You reach UPPMAX clusters either using a terminal client or Thinlinc
   - Graphics are included in Thinlinc and from terminal if you have enabled X11.
   - Which client to use?
       - Graphics and easy to use
       - ThinLinc
   - Best integrated systems
      - Visual Studio Code has several extensions (remote, SCP, programming IDE:s)
      - Windows: MobaXterm is somewhat easier to use.
  



Understanding clusters
----------------------

Overview of the UPPMAX systems
##############################

.. mermaid:: mermaid/uppmax2.mmd

Text editors on the Clusters
----------------------------
- Nano
- gedit
- mobaxterm built-in

Coding
------

- Basic knowledge of the languages used the different days. 
- We won't test your skills though.
- Rather you will learn to understand the ecosystems and navigations for the the different languages on a HPC cluster.

See below for links to useful material if you need a refresher before the course.

- More important is how to work in Linux and especially Bash
  
Linux
#####

- some familiarity with the LINUX command line (recordings from HPC2N:s Linux intro and UPPMAX Intro course), 

- See below for links to useful material if you need a refresher before the course.

   - https://www.youtube.com/watch?v=gq4Dvt2LeDg
   - https://www.uppmax.uu.se/support/courses-and-workshops/uppmax-introductory-course/
   - http://docs.uppmax.uu.se/getting_started/linux/
   - http://docs.uppmax.uu.se/getting_started/linux_basics/
  
Material for improving your programming skills
##############################################

First level
:::::::::::

`The Carpentries <https://carpentries.org/>`_ teaches basic lab skills for research computing.

- `Software carpentry courses/material <https://software-carpentry.org/lessons/>`_ 

Second level
::::::::::::

`Code Refinery <https://coderefinery.org/>`_ develops and maintains training material on software best practices for researchers that already write code. 

- Their material addresses all academic disciplines and tries to be as programming language-independent as possible. 
- `Code refinery lessons <https://coderefinery.org/lessons/>`_     

Third level
:::::::::::

`ENCCS (EuroCC National Competence Centre Sweden) <https://enccs.se/>`_ is a national centre that supports industry, public administration and academia accessing and using European supercomputers. They give higher-level training of programming and specific software.

- `ENCCS training material <https://enccs.se/lessons/>`_ 
