Pre-requirements
================

Technical on local computer
---------------------------

- terminal programs and thinLinc
- graphics

Terminals without graphics
#########

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

      - the ssh (secure shell) client `**putty**<https://www.putty.org/>`_ is sufficient first days of the course!

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

Add X11 graphics
################

.. tabs::

   .. tab:: Mac

      - Download and install **XQuartz** or other X11 server for Mac OS
         - <https://www.xquartz.org>

      - Start terminal (e.g. from Launchpad) or `iTerm2 <https://iterm2.com/>`_ 

   .. tab:: Windows

      - Install **`MobaXterm <https://mobaxterm.mobatek.net/>`_**  with built-in X11 and sftp file manager
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


````
`````

```{admonition} X11-forwarding from the command line (generally)

- Graphics can be sent through the SSH connection you’re using to connect
  - Use primarily `ssh -Y <...>` or secondary `ssh -X <...>`

- The X servers that enables graphics are needed, as mentioned above!
  - When starting a graphical program, a new window will open, but your terminal will be “locked”.
  - Run using "`&`" at the end to run it as a background process e.g. "`xeyes &`" or “`gedit &`”

![Caption](./img/xeyes.png)

- Alternatively, use `<ctrl>-z` to put e.g. gedit to sleep and type "`bg`" to make last process in background.
```




Try to log in
#############

- Follow the steps in the emaild instructions.


Test the X11 graphics with:

.. console::

   $ ssh -Y <username>@rackham.uppmax.uu.se

- ``-X``      Enables X11 forwarding. 
- ``-Y``      Enables trusted X11 forwarding


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

- Basic knowledge of the languages used the different days
  Links
  
Linux
#####

some familiarity with the LINUX command line (recordings from HPC2N:s Linux intro and UPPMAX Intro course), basic R, Python, or Julia, depending on which language(s) you are interested in. See below for links to useful material if you need a refresher before the course.
- https://www.youtube.com/watch?v=gq4Dvt2LeDg
- https://www.uppmax.uu.se/support/courses-and-workshops/uppmax-introductory-course/
  
