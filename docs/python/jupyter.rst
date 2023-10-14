Jupyter on compute nodes
========================

.. callout:: What is Jupyter?
	     
  - "The Jupyter Notebook is the original web application for creating and sharing computational documents. It offers a simple, streamlined, document-centric experience."
    - Run python interactively and make a "story" document with text and code and figures woven together. 
    - Includes file manager
  - You run it in a **web browser** (``firefox`` at UPPMAX and HPC2N)
  - This may be slow unless you run your browser in ThinLinc or locally or on you own computer (on HPC2N the JupyterLab is only accessible from within HPC2N's domain, which makes it easiest to use from inside ThinLinc).

  - The Jupyter project site contains a lot of information and inspiration. https://jupyter.org/
  - The Jupyter Notebook documentation. https://jupyter-notebook.readthedocs.io/en/stable/
  

UPPMAX
------

1. Start an interactive session from the login node
  
**For Rackham**

.. code-block:: sh

   $ interactive -A snic-project  -t 4:00:00

**For Snowy**

.. code-block:: sh

   $ interactive -M snowy -A snic-project  -t 4:00:00
   

2. Start jupyter notebook (from ``python/3.10`` also ``jupyter-lab``) from the interactive session (*when it gets allocated*)

.. code-block:: sh``
		
   $ module load python/3.9.5
   $ jupyter-notebook --ip 0.0.0.0 --no-browser


3. Connect to the running notebook 

Keep this session open and running. Note the node on which you are got the interactive job i.e. something like "r141".

In Thinlinc
'''''''''''

- If you are connected to Rackham via [Thinlinc session](https://www.uppmax.uu.se/support/user-guides/thinlinc-graphical-connection-guide/), open a browser with the link you got but modified to point to r486 i.e. 
``http://r486:8888/?token=5c3aeee9fbfc75f7a11c4a64b2b5b7ec49622231388241c2``

On own computer
'''''''''''''''

- If you use ssh to connect to Rackham, you need to forward the port of the interactive node to your local computer.
    - On Linux or Mac this is done by running in another terminal. Make sure you have the ports changed if they are not at the default ``8888``.

.. code-block:: sh
		
   $ ssh -L 8888:r486:8888 username@rackham.uppmax.uu.se

    - If you use Windows it may be better to do this in the PowerShell instead of a WSL2 terminal.
    - If you use PuTTY - you need to change the settings in "Tunnels" accordingly (could be done for the current connection as well).
    ![](../../img/putty.png)
    
    [SSH port forwarding](https://uplogix.com/docs/local-manager-user-guide/advanced-features/ssh-port-forwarding)
    

    On your computer open  the address you got but replace r486 with localhost i.e. 
``http://localhost:8888/?token=5c3aeee9fbfc75f7a11c4a64b2b5b7ec49622231388241c2``
or 
``http://127.0.0.0:8888/?token=5c3aeee9fbfc75f7a11c4a64b2b5b7ec49622231388241c2``

    This should bring the jupyter interface on your computer and all calculations and files will be on Rackham.


Kebnekaise
----------

Since the JupyterLab will only be accessible from within HPC2N's domain, it is by far easiest to do this from inside ThinLinc, so **this is highly recommended**. You can find information about using ThinLinc at HPC2N here: https://www.hpc2n.umu.se/documentation/guides/thinlinc

1. At HPC2N, you currently need to start JupyterLab on a specific compute node. To do that you need a submit file and inside that you load the JupyterLab module and its prerequisites (and possibly other Python modules if you need them - more about that later).

To see the currently available versions, do

``module spider JupyterLab``

You then do

``module spider JupyterLab/<version>``

for a specific <version> to see which prerequisites should be loaded first.

**Example, loading ``JupyterLab/3.2.8``**

``module load GCC/10.3.0 JupyterLab/3.2.8``

2. Making the submit file

Something like the file below will work. Remember to change the project id after the course, how many cores you need, and how long you want the JupyterLab to be available:

.. code-block:: slurm
		
   #!/bin/bash
   #SBATCH -A hpc2n2023-110
   # This example asks for 1 core
   #SBATCH -n 1
   # Ask for a suitable amount of time. Remember, this is the time the Jupyter notebook will be available! HHH:MM:SS.
   #SBATCH --time=05:00:00
 
   # Clear the environment from any previously loaded modules
   module purge > /dev/null 2>&1
 
   # Load the module environment suitable for the job
   module load GCC/10.3.0 JupyterLab/3.2.8

   # Start JupyterLab
   jupyter lab --no-browser --ip $(hostname)

Where the flags used to the Jupyter command has the following meaning (you can use ``Jupyter --help`` and ``Jupyter lab --help``> to see extra options):

- **lab**: This launches JupyterLab computational environment for Jupyter.
- **--no-browser**: Prevent the opening of the default url in the browser.
- **--ip=<IP address>**: The IP address the JupyterLab server will listen on. Default is 'localhost'. In the above example script I use ``$(hostname)`` to get the content of the environment variable for the hostname for the node I am allocated by the job.

**Note** again that the JupyterLab is *only* accessible from within the HPC2N domain, so it is easiest to work on the ThinLinc.

3. Submit the above submit file. Here I am calling it ``MyJupyterLab.sh``

``sbatch MyJupyterLab.sh``

4. Get the URL from the SLURM output file.

<p>Wait until the job gets resources allocated. Check the SLURM output file; when the job has resources allocated it will have a number of URLs inside at the bottom.</p>

<p>The SLURM output file is as default named <kdc>slurm-&lt;job-id&gt;.out where you get the &lt;job-id&gt; when you submit the SLURM submit file (as in item 3) here).&nbsp; </kdc></p>

<p><strong>NOTE</strong>: Grab the URL with the <u>hostname</u> since the localhost one requires you to login to the compute node and so will not work!</p>

<p>The file will look similar to this:</p>

<pre>
b-an01 [~]$ cat slurm-22422626.out
[I 2023-05-11 15:06:23.597 ServerApp] jupyterlab | extension was successfully linked.
[I 2023-05-11 15:06:23.756 LabApp] JupyterLab extension loaded from /hpc2n/eb/software/JupyterLab/3.2.8-GCCcore-10.3.0/lib/python3.9/site-packages/jupyterlab
[I 2023-05-11 15:06:23.756 LabApp] JupyterLab application directory is /cvmfs/ebsw.hpc2n.umu.se/amd64_ubuntu2004_bdw/software/JupyterLab/3.2.8-GCCcore-10.3.0/share/jupyter/lab
[I 2023-05-11 15:06:23.760 ServerApp] jupyterlab | extension was successfully loaded.
[I 2023-05-11 15:06:23.761 ServerApp] Serving notebooks from local directory: /pfs/stor10/users/home/b/bbrydsoe
[I 2023-05-11 15:06:23.761 ServerApp] Jupyter Server 1.13.4 is running at:
[I 2023-05-11 15:06:23.761 ServerApp] http://b-cn0232.hpc2n.umu.se:8888/lab?token=4e369c85f797f7de0c4e15723af75e93ad6bbe7cba11ae59
[I 2023-05-11 15:06:23.761 ServerApp]  or http://127.0.0.1:8888/lab?token=4e369c85f797f7de0c4e15723af75e93ad6bbe7cba11ae59
[I 2023-05-11 15:06:23.761 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2023-05-11 15:06:23.778 ServerApp]
    
    To access the server, open this file in a browser:
        file:///pfs/stor10/users/home/b/bbrydsoe/.local/share/jupyter/runtime/jpserver-173465-open.html
    Or copy and paste one of these URLs:
        http://b-cn0232.hpc2n.umu.se:8888/lab?token=4e369c85f797f7de0c4e15723af75e93ad6bbe7cba11ae59
     or http://127.0.0.1:8888/lab?token=4e369c85f797f7de0c4e15723af75e93ad6bbe7cba11ae59</pre>

<p>&nbsp;</p>

<p>In this case you should use this one:</p>

<pre>
http://b-cn0232.hpc2n.umu.se:8888/lab?token=4e369c85f797f7de0c4e15723af75e93ad6bbe7cba11ae59</pre>

<p>5) Start a webbrowser within HPC2N (ThinLinc interface). Put in the URL you grabbed, including the token:</p>

<p><img alt="jupyterlab-start.png" src="/sites/default/files/Documentation/Guides/JupyterLab/jupyterlab-start.png" width="800px" /></p>

<p>After a few moments JupyterLab starts up:</p>

<p><img alt="jupyterlab_started.png" src="/sites/default/files/Documentation/Guides/JupyterLab/jupyterlab_started.png" width="800px" /></p>

<p>You shut it down from the menu with "File" -&gt; "Shut Down"</p>

<h2>Running JupyterLab at HPC2N - extra Python modules</h2>

<h3>Already installed at HPC2N</h3>

<p>If you need extra Python modules and these modules are already installed at HPC2N, you can just load them. It is easiest to do so before you start the JupyterLab, inside the submit file.</p>

<p><strong>Example, loading JupyterLab/3.2.8, its prerequisites, and the modules for SciPy-bundle (mpi4py, numpy, pandas, scipy etc.) and matplotlib </strong>:</p>

<pre>
#!/bin/bash
# Here you should put your own project id
#SBATCH -A hpc2nXXXX-YYY
# This example use 1 core
#SBATCH -n 1
# Ask for a suitable amount of time. Remember, this is the time the Jupyter notebook will be available! HHH:MM:SS.
#SBATCH --time=05:00:00

# Clear the environment from any previously loaded modules
module purge &gt; /dev/null 2&gt;&amp;1

# Load the module environment suitable for the job
module load GCC/10.3.0 JupyterLab/3.2.8 OpenMPI/4.1.1 SciPy-bundle/2021.05 matplotlib/3.4.2

# Start JupyterLab
jupyter lab --no-browser --ip $(hostname)</pre>

<h3>&nbsp;</h3>

<p>See <a href="#flags">here for an explanation of the options</a> to jupyter.</p>

<h3><br />
With some own-installed Python packages</h3>

<p>Running JupyterLab with some own-installed Python packages requires you to use a virtual environment and your own Jupyter kernel. This is not as difficult as it may sound.</p>

<p><strong>Example Own-installed pyDOE and torch. Using JupyterLab/3.4.2</strong></p>

<p>1) First we need to load the modules that we need for our own-installed packages, and for the JupyterLab.</p>

<p>pyDOE and torch has some prerequisites, some of which are already installed at HPC2N. We will start by loading the available prerequisite modules:</p>

<pre>
module load GCC/10.3.0 JupyterLab/3.2.8 OpenMPI/4.1.1 SciPy-bundle/2021.05 matplotlib/3.4.2</pre>

<p>2) We now need to create a virtual environment (venv) to install our own packages in. I am placing it in the Public directory under my home directory ($HOME), but you could instead place it in your project storage. I am calling the venv "jupvenv", but you can call it what you want:</p>

<pre>
python -m venv $HOME/Public/jupvenv</pre>

<p>3) Activate the venv</p>

<pre>
source $HOME/Public/jupvenv/bin/activate</pre>

<p>4) Install ipykernel in the venv. This is needed to be able to make your own Jupyter kernel which can use the own-installed Python packages</p>

<pre>
pip install --no-cache-dir --no-build-isolation ipykernel</pre>

<p><strong>NOTE</strong>! It may complain of missing prerequisites. If so, instead install:</p>

<pre>
pip install --no-cache-dir --no-build-isolation pyparsing pytz jinja2 packaging webencodings cffi babel jsonschema requests tomlkit wheel ipykernel</pre>

<p>5) Install your Python packages in the venv, here pyDOE and torch</p>

<pre>
pip install --no-cache-dir --no-build-isolation pyDOE torch</pre>

<p>6) Install the new kernel in Jupyter (here called jupvenv)</p>

<pre>
python -m ipykernel install --user --name=jupvenv</pre>

<p>7) Check list of kernels to see your new kernel</p>

<pre>
jupyter kernelspec list</pre>

<p>Later you can remove the kernel if you feel like, using this:</p>

<pre>
jupyter kernelspec uninstall jupvenv</pre>

<p>8) Now make a submit file as before. Something like this should work:</p>

<pre>
#!/bin/bash
# Here you should put your own project id
#SBATCH -A hpc2nXXXX-YYY
# Here allocating 1 core - change as suitable for your case
#SBATCH -n 1
# Ask for a suitable amount of time. Remember, this is the time the Jupyter notebook will be available!
#SBATCH --time=05:00:00
 
# Clear the environment from any previously loaded modules
module purge &gt; /dev/null 2&gt;&amp;1
 
# Load the module environment suitable for the job
module load GCC/10.3.0 JupyterLab/3.2.8 OpenMPI/4.1.1 SciPy-bundle/2021.05 matplotlib/3.4.2

# Activate the venv you installed your own Python packages to
source $HOME/Public/jupvenv/bin/activate

# Start JupyterLab
jupyter lab --no-browser --ip $(hostname)

</pre>

<p>See <a href="#flags">here for an explanation of the options</a> to jupyter.</p>

<p>9) Submit the above submit file (here I named it MyJupvenv.sh).</p>

<pre>
sbatch MyJupvenv.sh</pre>

<p>You get the &lt;job-id&gt; when you do the above command.</p>

<p>Check the SLURM output file (slurm-&lt;job.id&gt;.out); grab the URL <u>with the hostname</u> as described in the first part of this document, since the localhost one requires you to login to the compute node.</p>

<p>10) Start a webbrowser within HPC2N (ThinLinc interface). Put in the URL you grabbed, including the token.</p>

<p>11) Inside JupyterLab, start the new kernel. Just click the launcher for that one if no other kernel is running.</p>

<p>If a kernel is running (shown under kernels), then shut down that kernel and click "Kernel" in the menu, and then "Change kernel". Pick your kernel from the drop-down menu.</p>

<p>12) You can now run your files etc. with the own-installed Python packages available.</p>

<p><strong>NOTE</strong>! Sometimes it is still running on the default kernel. If so, Click the 3 little dots in the right side of the editor-window for the program and <u>pick your kernel</u>. Then rerun your files.</p>
