Isolated environments
=====================

.. note::
   Isolated environments solve a couple of problems:
   
   - You can install specific, also older, versions into them.
   - You can create one for each project and no problem if the two projects require different versions.
   - You can remove the environment and create a new one, if not needed or with errors.
   
.. questions::

   - How to work with isolated environments?

.. objectives:: 

   - Give a general *theoretical* introduction to isolated environments 

In the Python's lesson on environments, we saw that there are different ways to deal with isolated 
environments in this language, for instance, ``conda`` and ``pip``. This situation is simplified
in Julia (if you are working with Julia code only) because environemnts are managed by Julia
itself. Julia distinguishes between **project environments** and **package directories** 
(https://docs.julialang.org/en/v1/manual/code-loading/#Environments). In the former, only the
Tom's Obvious Minimal Language (TOML) files (Project.toml, Manifest.toml) are present while in the
latter also source files are included with some specific layout. 

Packages in Julia work as decentralized units which can be connected through their 
universally unique identifiers (UUIDs) in the so-called federated package management. 
The active environments can be seen with the command:

.. code-block:: julia-repl

   julia>LOAD_PATH
   3-element Vector{String}:
   "@"
   "@v#.#"
   "@stdlib"

where ``@`` is the current environment, ``@v#.#`` is the default environment for the 
Julia version that is being in use, and ``@stdlib`` is the standard library. 
Thus, by default in addition to the current environment other environments are present
which can potentially create conflicts for reproducibility if you are not aware of what
Julia is doing under the hood. Later on, we will see possible strategies to avoid this
situation.

In a fresh Julia installation, we can see the following project information:

.. code-block:: julia-repl

   julia> using Pkg

   julia> Pkg.project()
   Pkg.API.ProjectInfo(nothing, nothing, nothing, false, Dict{String, Base.UUID}(), "/pfs/stor10/users/home/p/pojedama/.julia/environments/v1.8/Project.toml")

Here, we can see among other things that nothing (any package) has been added to project,
the UUID of the project, and the location of the toml file.  
Let's install a package ``DFTK``, for instance, that performs Density Functional Theory
routines (https://juliapackages.com/p/dftk):

.. code-block:: julia-repl

   julia> using Pkg
   julia> Pkg.add("DFTK")
           Info Packages marked with ⌅ have new versions available but compatibility constraints restrict them from upgrading. To see why use `status --outdated -m`
   Precompiling project...
   104 dependencies successfully precompiled in 43 seconds

Now, the project information tells us about the new installed package:

.. code-block:: julia-repl

   julia> Pkg.project()
   Pkg.API.ProjectInfo(nothing, nothing, nothing, false, Dict{String, Base.UUID}("DFTK" => UUID("acf6eb54-70d9-11e9-0013-234b7a5f5337")), "/pfs/stor10/users/home/p/pojedama/.julia/environments/v1.8/Project.toml")


Create a project environment
----------------------------

Let's now create a **project environment**, this can be done as follows:

.. code-block:: julia

   julia> using Pkg
   julia>;
   shell> mkdir my-first-env
   shell> cd my-first-env
      /pfs/proj/nobackup/path/Julia-Test/my-first-env
   shell> #type backspace#
   julia> ]  
   (v1.8) pkg> activate . 
      Activating new project at `/pfs/proj/nobackup/path/Julia-Test/my-first-env`
   (my-first-env) pkg> #type backspace
   julia> ;
   shell> ls  

We can see that our environment in parenthesis has been activated. At this stage nothing has
been added in the folder *my-first-env* as you can see from the empty output of the ``ls`` command. 
Notice that now that we are in this new environment, the default and standard library environments
are also present as before:

.. code-block:: julia

   julia> LOAD_PATH
   3-element Vector{String}:
   "@"
   "@v#.#"
   "@stdlib"

This can be confirmed if we try to load the ``DFTK`` package that we installed previously as the
command ``using DFTK`` will execute without any complaints. If we install the ``DFTK`` package
we will notice some differences w.r.t. the previous installation: 

.. code-block:: julia

   (my-first-env) pkg> add DFTK 
   Resolving package versions...
    Updating `/pfs/proj/nobackup/path/Julia-Test/my-first-env/Project.toml`
   [acf6eb54] + DFTK v0.6.2
    Updating `/pfs/proj/nobackup/path/Julia-Test/my-first-env/Manifest.toml`

First, we notice that installation was much faster than before. This is because **Pkg** did not do
a new installation but it just updated our environment with information of the available
``DFTK`` package. Specifically, if you take a look at the content of the current directory
you will see the new files ``Project.toml`` and ``Manifest.toml``, the ``more`` command can display
the content of these files:

.. code-block:: julia

   shell> ls
   Manifest.toml  Project.toml

   shell> more Project.toml 
   [deps]
   DFTK = "acf6eb54-70d9-11e9-0013-234b7a5f5337"

   shell> more Manifest.toml
   # This file is machine-generated - editing it directly is not advised

   julia_version = "1.8.5"
   manifest_format = "2.0"
   project_hash = "48bbaa26b07ee1ca85ad746dc9b2f772ba10b675"

   [[deps.AbstractFFTs]]
   deps = ["ChainRulesCore", "LinearAlgebra"]
   git-tree-sha1 = "69f7020bd72f069c219b5e8c236c1fa90d2cb409"
   uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
   version = "1.2.1"

   [[deps.Adapt]]
   deps = ["LinearAlgebra"]
   git-tree-sha1 = "195c5505521008abea5aee4f96930717958eac6f"
   uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
   version = "3.4.0"

   ...

Here, we can observe that the ``Project.toml`` only gives us the UUID of the project while the
``Manifest.toml`` file contains the full information about the dependencies versions and organization
layout. Notice the message regarding editing for the latter. Let's leave this environment: 


.. code-block:: julia

   (my-first-env) pkg> activate 
      Activating project at `~/.julia/environments/v1.8`

   (v1.8) pkg> 


Create a package environment
----------------------------

A package environment can be created by using the ``generate`` function in ``package mode``
or ``Pkg.generate()`` in ``Julian`` mode:

.. code-block:: julia

   (v1.8) pkg> generate myfirstpackage 
    Generating  project myfirstpackage:
    myfirstpackage/Project.toml
    myfirstpackage/src/myfirstpackage.jl

One can activate this enviroment in the following way:

.. code-block:: julia

   shell> cd myfirstpackage 
   (v1.8) pkg> activate . 
   Activating project at `/pfs/proj/nobackup/path/Julia-Test/my-first-env/myfirstpackage`
   (myfirstpackage) pkg> 


The ``project`` function tells us that the current project has an UUID assigned to it:

.. code-block:: julia

   julia> Pkg.project()
   Pkg.API.ProjectInfo("myfirstpackage", UUID("ca799254-944c-4043-b9e3-b70b93409f34"), v"0.1.0", true, Dict{String, Base.UUID}(), "/pfs/proj/nobackup/path/Julia-Test/my-first-env/myfirstpackage/Project.toml")

As in the ``project environment``, the ``package environment`` can see the default and 
the standard library environments. 

Let's add the package ``Flux`` for Machine Learning routines:

.. code-block:: julia

   (myfirstpackage) pkg> add Flux
     Precompiling project...
     49 dependencies successfully precompiled in 92 seconds. 43 already precompiled.
   (myfirstpackage) pkg> status
     Project myfirstpackage v0.1.0
     Status `/pfs/proj/nobackup/path/Julia-Test/my-first-env/myfirstpackage/Project.toml`
     [587475ba] Flux v0.13.11

where the status function tells us information about the packages that are installed
in the current environment, for instance the ``Flux`` version that we just installed.


Customizing the set of visible environments
------------------------------------------

We saw previously that by default some enviroments are visible to new environments.
One can customize this setting with the variable ``JULIA_LOAD_PATH``, this can be
done on the Linux command line:


.. code-block:: julia

   export JULIA_LOAD_PATH="path1:path2:..."

For instance, for including just the current environment we can set the value of 
this variable as:

.. code-block:: julia

   export JULIA_LOAD_PATH="@"

Then, when we start a ``julia`` session the default option will be the current
enviroment:

.. code-block:: julia
   
   julia> LOAD_PATH
   1-element Vector{String}:
   "@"







.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environemnts.
      - UPPMAX has  Conda and venv
      - HPC2N has virtualenv.
      - More details in the separated sessions!
 
   
