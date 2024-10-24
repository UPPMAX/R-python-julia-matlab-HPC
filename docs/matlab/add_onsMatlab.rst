Add-Ons
=======

.. admonition:: MATLAB Add-Ons
   
   - Add-ons extend the capabilities of MATLAB® by providing additional functionality for specific tasks and applications, such as:
      - connecting to hardware devices
      - additional algorithms
      - interactive apps
   - Available from:
      - MathWorks® 
      - the global MATLAB user community
   - Encompass a wide variety of resources
      - products
      - apps
      - toolboxes
      - support packages
   - `More information <https://se.mathworks.com/help/matlab/add-ons.html?s_tid=CRUX_lftnavZ>`_
   

.. admonition:: Learners should be able to

   - navigate to toolboxes and add-ons
   - view add-ons and toolboxes
   - install and use add-ons    
   
- Before going into installing Add-Ons let's have a background to the MATLAB environments and ecosystem!

MATLAB Add-Ons manager
----------------------

In the GUI, the Add-Ons manager can be selected from the menu at the top. The drop-down menu options allow users to:
   - **Browse a library of Add-Ons to download.** Note that some Add-Ons require a separate license.
   - **Manage Add-Ons already downloaded.**
   - Package user-generated code as a Toolbox or App
   - Get hardware-related support packages

Here we will only focus on the first two options.

.. note::

   Note that very many packages are already included in the  Academic installation and license

.. admonition:: Some toolboxes

   - Matlab products
      - Parallel Computing Toolbox
      - MATLAB Parallel Server
      - Deep Learning Toolbox
      - Statistics and Machine Learning Toolbox
   - Simulink
      - Stateflow
      - SimEvents
      - Simscape

.. admonition:: Some toolboxes provides GUI for their tools Apps

   - Matlab products
      - Deep Network Designer - Design and visualize deep learning networks Deep Network Designer
      - Curve Fitter - Fit curves and surfaces to data
      - Deep Learning Toolbox
      - Statistics and Machine Learning Toolbox
   - Simulink
      - Stateflow
      - SimEvents
      - Simscape

    .. figure:: ./img/apps.PNG

    - We won't cover the usage of the toolboxes here!


DUMP
----

.. figure:: ./img/Toolbar_Add-Ons.PNG

.. figure:: ./img/Add-On_explorer.PNG

.. figure:: ./img/my_products.PNG

.. figure:: ./img/Add-On_manager.PNG



Install Add-Ons from File
~~~~~~~~~~~~~~~~~~~~~~~~~

<https://se.mathworks.com/help/matlab/matlab_env/get-add-ons.html>

You can install some Add-Ons manually using an installation file. This is useful in several situations:
- The add-on is not available for installation through the Add-On Explorer, for example, if you create a custom add-on yourself or receive one from someone else.
- You downloaded the add-on from the Add-On Explorer without installing it.
- You downloaded the add-on from the File Exchange at MATLAB Central™.

.. warning::

   To be able to you need however use email for mathworks account.

Default Add-On Installation Folder
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The install location of an add-on depends on its type. MATLAB installs MathWorks® products in the matlabroot folder and hardware support packages in the folder returned by matlabshared.supportpkg.getSupportPackageRoot. For more information about a specific support package install location, see the documentation for the package.

- Linux® — ~/MATLAB Add-Ons

It's in the path so it should be possible to run directly if you don't need to run a installation file.

Exercises
---------

.. challenge:: 1. Find the **kalmanf** and install it and run a test command.

.. challenge:: 2. (Optional) Browse the add-ons and get inspired for your own work!

