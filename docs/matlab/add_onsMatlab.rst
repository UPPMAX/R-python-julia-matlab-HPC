Add-Ons
=======

.. admonition:: MATLAB Add-Ons and environments
   
   - MATLAB **Add-Ons broaden the use of MATLAB** considerably! 
   - Instead of writing code yourself there may be others that have done the same!
   - Isolated environments solve a couple of problems:

      - You can install specific, also older, versions into them.
      - You can create one for each project and no problem if the two projects require different versions.
      - You can remove the environment and create a new one, if not needed or with errors.
   
.. questions::

   - How to install Add-Ons?
   - How to work with isolated environments?
   - How to check for and use the UPPMAX pre-installed Add-Ons?
   

.. objectives:: 

   - Give a general *theoretical* introduction to isolated environments 
   - Show how to install own Add-Ons
   - Show how to check for MATLAB Add-Ons at UPPMAX
   
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

Find the **kalmanf** and install it and run a test command.
