Log in session 
==============

Prepare your environment now!
-----------------------------

.. type-along::
  
   - Please log in to Rackham, Kebnekaise or other cluster that you are using.

   .. admonition:: Use Thinlinc or terminal?

      - It is up to you!
      - Graphics come easier with Thinlinc
      - For this course, when having many windows open, it may be better to run in terminal, for screen space issues.


   .. tabs::

      .. tab:: UPPMAX

         1. Log in to Rackham!

           - Terminal: ``ssh -X <user>@rackham.uppmax.uu.se`` 
      
           - ThinLinc app: ``<user>@rackham-gui.uppmax.uu.se``
           - ThinLinc in web browser: ``https://rackham-gui.uppmax.uu.se``
      
         2. If not already: **create a working directory** where you can code along.

           - We recommend creating it under the course project storage directory
   
         3. Example. If your username is "mrspock" and you are at UPPMAX, then we recommend you create this folder: 
     
            .. code-block:: console
         
               $ mkdir /proj/r-py-jl/mrspock/
               $ mkdir /proj/naiss2024-22-107/mrspock/

      .. tab:: HPC2N

         - Kebnekaise through terminal: ``<user>@kebnekaise.hpc2n.umu.se``     
         - Kebnekaise through ThinLinc, use: ``<user>@kebnekaise-tl.hpc2n.umu.se``
   
         - Create a working directory where you can code along.    
      
           - Example. If your username is bbrydsoe and you are at HPC2N, then we recommend you create this folder: 
     
           .. code-block:: console
         
              $ /proj/nobackup/hpc2n2023-110/bbrydsoe/

      .. tab:: Cosmos

         - Cosmos through terminal: ``<user>@cosmos.lunarc.lu.se``     
         - Cosmos through ThinLinc, use: ``<user>@cosmos-dt.lunarc.lu.se ``

         - Create a working directory where you can code along.    
      
           - Example. If your username is bbrydsoe and you are at HPC2N, then we recommend you create this folder: 
     
           .. code-block:: console
         
              $ /proj/nobackup/hpc2n2023-110/bbrydsoe/
