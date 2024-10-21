Python packages
===============

.. tabs::

    .. tab:: Learning objectives

        - navigate the documentation
        - determine which Python packages are installed
        - load a module that adds more pre-installed Python packages
        - install a Python package

    .. tab:: For teachers

        Teaching goals are:

        - Learners have navigated the documentation
        - Learners have determined which Python packages are installed
        - Learners have loaded a module
          that adds more pre-installed Python packages
        - Learners have installed a Python package

        Lesson plan (30 minutes in total):

        - 5 mins: prior knowledge
            - What are Python packages?
            - Why use Python packages?
            - How to find out if a package is already installed?
            - What are some Python package installers?
            - What are the differences?
        - 5 mins: presentation
        - 15 mins: challenge
        - 5 mins: feedback
            - What are Python packages?
            - Why use Python packages?
            - How to find out if a package is already installed?
            - What are some Python package installers?
            - What are the differences?

.. admonition:: Compute allocations in this workshop 

    - Rackham: ``naiss2024-22-1202``
    - Kebnekaise: ``hpc2n2024-114``
    - Cosmos: ``lu2024-7-80``

.. admonition:: Storage space for this workshop 

    - Rackham: ``/proj/r-py-jl-m-rackham``
    - Kebnekaise: ``/proj/nobackup/r-py-jl-m``

Introduction
------------

Packages are pieces of Python code written to be used by others.
When possible, using an existing Python package
is usually smarter than writing code yourself.
In this session, we practice working with packages.

Finding packages
----------------

.. mermaid:: package_user_journey.mmd

The most common Python packages come installed when loading a regular Python module.
Some of the more complex packages, are part of a module for more complex Python packages.
If a package is not installed, however, you can also install it.

Python package installers
-------------------------

.. mermaid:: package_installers.mmd

There are two Python package installers, called ``conda`` and ``pip``.

In this session, we use ``pip``, as it can be used on all
the HPC clusters used in this course:

+-------------------+-----------------+------------------+------------------+
| Package installer | HPC2N           | LUNARC           | UPPMAX's Rackham |
+===================+=================+==================+==================+
| ``conda``         | Unsupported [1] | Recommended [2]  | Supported        |
+-------------------+-----------------+------------------+------------------+
| ``pip``           | Recommended     | Available        | Recommended      |
+-------------------+-----------------+------------------+------------------+

- ``[1]`` `HPC2N guide against using conda <https://www.hpc2n.umu.se/documentation/guides/anaconda>`_
- ``[2]`` `LUNARC Python user guide <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Python/#recommended-use>`_

In this session we use ``pip``, 
because it is a commonly-used package installation system
that works on all HPC clusters used in this course.

As a first impression, however, here is a simple comparison between the two:

+------------------------------+-----------+----------+
| Parameter                    | ``conda`` | ``pip``  |
+==============================+===========+==========+
| Installs Python packages     | Yes       | Yes      |
+------------------------------+-----------+----------+
| Installs non-Python software | Yes       | No       |
+------------------------------+-----------+----------+

We have not scheduled to discuss ``conda`` in this course, 
yet teaching materials can be found at `Conda at UPPMAX <https://uppmax.github.io/R-python-julia-matlab-HPC/python/condaUPPMAX.html>`_.

In this session, we will install packages to your default user folder.
Because this one default user folder, installing a different version of one package
for one computational experiment, may have consequences for others.
These problems are addressed in the session on isolated environments.

Exercises
---------

These exercises follow a common user journey, 
for a user that needs to use a certain Python packages:

- In exercise 1, we use a Python package that comes with the Python module
- In exercise 2, we use a Python package that comes with a software module
- In exercise 3, we install a Python package ourselves

Like any user, we'll try to be autonomous and read your favorite HPC center's
documentation.

Exercise 1: loading a Python package that comes with the Python module
----------------------------------------------------------------------

.. admonition:: Learning objectives

    - Practice reading documentation
    - Apply/rehearse the documentation to load a module
    - Apply the documentation to show if a Python package is already installed

Some Python packages come with loading a Python module.
Here we see this in action.

For this exercise, use the documentation of your HPC center:

- `HPC2N <https://docs.hpc2n.umu.se/documentation/modules>`_
- `LUNARC <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Python/>`_
- `UPPMAX <http://docs.uppmax.uu.se/software/python/>`_

Load the Python module of the correct version,
including prerequisite modules if needed:

- HPC2N: version 3.11.3
- LUNARC: TODO
- UPPMAX: version 3.11.8

.. dropdown:: Answer HPC2N

    ``module load GCC/12.3.0 Python/3.11.3``

.. dropdown:: Answer LUNARC

    TODO

.. dropdown:: Answer UPPMAX

    ``module load python/3.11.8``

How to determine if a Python package is installed?

.. dropdown:: Answer

    There are multiple ways. One easy one, is, in a terminal, type:

    .. code-block::

        pip list

The Python package ``wheel`` is known to be installed. Which version?

.. dropdown:: Answer HPC2N

    When doing ``pip list``, look for ``wheel`` in the list.
    You'll find ``wheel`` to have version ``0.40.0``

.. dropdown:: Answer LUNARC

    When doing ``pip list``, look for ``wheel`` in the list.
    You'll find ``wheel`` to have version ``TODO``

.. dropdown:: Answer UPPMAX

    When doing ``pip list``, look for ``wheel`` in the list.
    You'll find ``wheel`` to have version ``0.40.0``

Exercise 2: loading a Python package that comes with a module
-------------------------------------------------------------

.. admonition:: Learning objectives

    - Practice reading documentation
    - Rehearse the documentation to load a Python machine learning module
    - Apply the documentation to show if a Python package is already installed

Some Python packages need another module to be loaded.
In this exercise, we search for and use a module to use a pre-installed
Python package.
The Python package we use differs by center:

- HPC2N: Theano (as a Python package for Python 3.7.4)
- LUNARC: Unknown
- UPPMAX: TensorFlow (as a Python package for CPU)

Use your center's documentation to find out which module to load your Python
package with.

.. dropdown:: Hint HPC2N

    It is hard to find useful information on Theano
    at `the HPC2N documentation <https://docs.hpc2n.umu.se/>`_.

    Instead, search the main HPC2N website at
    `https://www.hpc2n.umu.se/ <https://www.hpc2n.umu.se/>`.

.. dropdown:: Answer HPC2N

    Searching for 'Theano' at the main HPC2N website at
    `https://www.hpc2n.umu.se/ <https://www.hpc2n.umu.se/>`.
    takes one to `the Theano page <https://www.hpc2n.umu.se/resources/software/theano>`_

    Here, it is recommended to do:

    .. code-block:: python
        module spider theano

    There are two versions of Theano, we need the second one:

    - ``Theano/1.1.2-PyMC``
    - ``Theano/1.0.4-Python-3.7.4``

    Getting the information of it:

    .. code-block:: python
        module spider Theano/1.0.4-Python-3.7.4

    This tells us to do:

    .. code-block:: python
        module load GCC/8.3.0  OpenMPI/3.1.4 Theano/1.0.4-Python-3.7.4

    Finding out the package version:

    .. code-block:: python
        pip list

    Gives us:

    .. code-block:: python
        Theano                        1.0.4

.. dropdown:: Answer HPC2N

    TODO

.. dropdown:: Answer UPPMAX

    Searching for ``TensorFlow`` at 
    `the UPPMAX documentation <https://docs.uppmax.uu.se>`_
    takes you to
    `the TensorFlow page <https://docs.uppmax.uu.se/software/tensorflow>`_.
    There, clicking on 'TensorFlow as a Python package for CPU' takes you to
    the header `TensorFlow as a Python package for CPU <https://docs.uppmax.uu.se/software/tensorflow/#tensorflow-as-a-python-package-for-cpu>`_.


Load the module for the Python package and verify if it is loaded.

.. dropdown:: Answer HPC2N

    Search the module system with these commands:

    - ``module spider Theano`` redirects you to 
      ``module spider Theano/1.1.2-PyMC``
    - At ``module spider Theano/1.1.2-PyMC`` follow the instructions:
        - ``module load GCC/10.2.0``
        - ``module load OpenMPI/4.0.5``
        - ``module load Theano/1.1.2-PyMC``
        - ``pip list`` to find ``Theano-PyMC`` with version ``1.1.2``

    ..
        _This: is a comment!

        b-an01 [~]$ module load GCC/10.2.0
        b-an01 [~]$ module load OpenMPI/4.0.5
        b-an01 [~]$ module load Theano/1.1.2-PyMC
        b-an01 [~]$ pip list
        Package                       Version
        ----------------------------- ----------
        alabaster                     0.7.12
        appdirs                       1.4.4
        asn1crypto                    1.4.0
        [...]
        sphinxcontrib-websupport      1.2.4
        tabulate                      0.8.7
        Theano-PyMC                   1.1.2
        threadpoolctl                 2.1.0
        toml                          0.10.1
        tomlkit                       0.7.0
        [...]
        wheel                         0.35.1
        xlrd                          1.2.0
        zipp                          3.3.0

.. dropdown:: Answer LUNARC

    Search the module system with these commands    

    - LUNARC: TODO

.. dropdown:: Answer UPPMAX

    - Copy from the documentation: ``module load python_ML_packages/3.11.8-cpu``
    - ``pip list`` to find ``tensorflow-cpu`` with version ``2.16.1``

    ..
        _This: is a comment!

        [richel@rackham3 ~]$ module list

        Currently Loaded Modules:
          1) uppmax

        [richel@rackham3 ~]$ module load python_ML_packages/3.11.8-cpu
        [richel@rackham3 ~]$ pip list
        Package                      Version
        ---------------------------- ---------------
        absl-py                      2.1.0
        anndata                      0.10.5.post1
        anyio                        4.2.0
        [...]
        tensorboard                  2.16.2
        tensorboard-data-server      0.7.2
        tensorflow-cpu               2.16.1
        tensorflow-datasets          4.9.4
        tensorflow-io-gcs-filesystem 0.37.0
        [...]
        xxhash                       3.4.1
        zipp                         3.17.0
        zope.interface               6.1

Exercise 3
----------

.. admonition:: Learning objectives

    - Practice reading documentation
    - Install a new package.

Some Python packages are not pre-installed on your HPC cluster.
Here we install a Python package ourselves.

Use your center's documentation to find out how to install Python packages
using ``pip``.

.. dropdown:: Answer HPC2N

    Searching for 'pip install' at `the HPC2N documentation <https://docs.hpc2n.umu.se/>`
    takes one to `Working with venv <https://docs.hpc2n.umu.se/tutorials/userinstalls/#working__with__venv>`_
    (whatever that is). Searching for ``pip install`` takes use to
    the HPC2N recommendation there to use ``pip install --no-cache-dir --no-build-isolation MYPACKAGE``

.. dropdown:: Answer LUNARC

    TODO

.. dropdown:: Answer UPPMAX

    UPPMAX: searching for ``pip install`` at 
    `the UPPMAX documentation <https://docs.uppmax.uu.se>`_
    takes you to
    `Installing Python packages <https://docs.uppmax.uu.se/software/python_install_packages/>`_.
    There, clicking on the link 'pip' takes you to
    `pip <https://docs.uppmax.uu.se/software/python_install_packages/#pip>`_.
    The UPPMAX recommendation there to use ``pip install --user [package name]``

Install a Python package called ``mhcnuggets``. Which version gets installed?

.. dropdown:: Answer HPC2N

    Do ``pip install --no-cache-dir --no-build-isolation mhcnuggets``,
    then ``pip list`` to see that ``mhcnuggets`` version 2.4.1
        
    ..
        _This: is a comment!
        
        b-an01 [~]$ pip install --no-cache-dir --no-build-isolation mhcnuggets
        Defaulting to user installation because normal site-packages is not writeable
        Collecting mhcnuggets
          Downloading mhcnuggets-2.4.1-py2.py3-none-any.whl (108.8 MB)
             |████████████████████████████████| 108.8 MB 1.0 MB/s 
        Collecting scikit-learn
          Downloading scikit_learn-1.3.2-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (11.1 MB)
             |████████████████████████████████| 11.1 MB 42.2 MB/s 
        [...]
        tensorflow 2.13.1 requires keras<2.14,>=2.13.1, but you'll have keras 2.15.0 which is incompatible.
        tensorflow 2.13.1 requires numpy<=1.24.3,>=1.22, but you'll have numpy 1.19.4 which is incompatible.
        Successfully installed MarkupSafe-2.1.5 absl-py-2.1.0 astroid-2.15.8 astunparse-1.6.3 biopython-1.83 cachetools-5.5.0 datacache-1.4.1 dill-0.3.9 flatbuffers-24.3.25 gast-0.4.0 google-auth-2.35.0 google-auth-oauthlib-1.0.0 google-pasta-0.2.0 grpcio-1.67.0 gtfparse-2.5.0 h5py-3.11.0 importlib-metadata-8.5.0 isort-5.13.2 joblib-1.4.2 keras-2.15.0 lazy-object-proxy-1.10.0 libclang-18.1.1 markdown-3.7 mccabe-0.7.0 memoized-property-1.0.3 mhcnuggets-2.4.1 oauthlib-3.2.2 opt-einsum-3.4.0 platformdirs-4.3.6 polars-0.20.31 progressbar33-2.4 protobuf-4.25.5 pyarrow-14.0.2 pyasn1-modules-0.4.1 pyensembl-2.3.13 pylint-2.17.7 pyvcf3-1.0.3 requests-oauthlib-2.0.0 rsa-4.9 scikit-learn-1.3.2 sercol-1.0.0 serializable-0.4.1 tensorboard-2.13.0 tensorboard-data-server-0.7.2 tensorflow-2.13.1 tensorflow-estimator-2.13.0 tensorflow-io-gcs-filesystem-0.34.0 termcolor-2.4.0 tinytimer-0.0.0 tomli-2.0.2 tomlkit-0.13.2 typechecks-0.1.0 typing-extensions-4.5.0 varcode-1.2.1 werkzeug-3.0.4 wrapt-1.16.0 zipp-3.20.2
        b-an01 [~]$ pip list
        Package                       Version
        ----------------------------- ----------
        absl-py                       2.1.0
        alabaster                     0.7.12
        appdirs                       1.4.4
        [...]
        mccabe                        0.7.0
        memoized-property             1.0.3
        mhcnuggets                    2.4.1
        mock                          4.0.2
        more-itertools                8.5.0
        [...]
        wrapt                         1.16.0
        xlrd                          1.2.0
        zipp                          3.20.2
        b-an01 [~]$ 

.. dropdown:: Answer LUNARC

    TODO

.. dropdown:: Answer UPPMAX

    Do ``pip install mhcnuggets``, then ``pip list`` to see that ``mhcnuggets`` version 2.4.1
    gets installed
                
    ..
        _This: is a comment!

        [richel@rackham1 ~]$ module load python/3.11.8
        [richel@rackham1 ~]$ pip install mhcnuggets
        Defaulting to user installation because normal site-packages is not writeable
        Collecting mhcnuggets
          Using cached mhcnuggets-2.4.1-py2.py3-none-any.whl.metadata (2.5 kB)
        Requirement already satisfied: numpy in /sw/comp/python/3.11.8/rackham/lib/python3.11/site-packages (from mhcnuggets) (1.26.4)
        Requirement already satisfied: scipy in /sw/comp/python/3.11.8/rackham/lib/python3.11/site-packages (from mhcnuggets) (1.12.0)
        Collecting scikit-learn (from mhcnuggets)
          Downloading scikit_learn-1.5.2-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (13 kB)
        Requirement already satisfied: pandas in /sw/comp/python/3.11.8/rackham/lib/python3.11/site-packages (from mhcnuggets) (2.2.0)
        [...]
          WARNING: The scripts varcode and varcode-genes are installed in '/home/richel/.local/bin' which is not on PATH.
          Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
          WARNING: The scripts import_pb_to_tensorboard, saved_model_cli, tensorboard, tf_upgrade_v2, tflite_convert, toco and toco_from_protos are installed in '/home/richel/.local/bin' which is not on PATH.
          Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
        Successfully installed absl-py-2.1.0 appdirs-1.4.4 astroid-2.15.8 astunparse-1.6.3 biopython-1.84 datacache-1.4.1 dill-0.3.9 flatbuffers-24.3.25 gast-0.6.0 google-pasta-0.2.0 grpcio-1.67.0 gtfparse-2.5.0 isort-5.13.2 keras-3.6.0 lazy-object-proxy-1.10.0 libclang-18.1.1 markdown-it-py-3.0.0 mdurl-0.1.2 memoized-property-1.0.3 mhcnuggets-2.4.1 ml-dtypes-0.4.1 namex-0.0.8 opt-einsum-3.4.0 optree-0.13.0 polars-0.20.31 progressbar33-2.4 protobuf-4.25.5 pyarrow-14.0.2 pyensembl-2.3.13 pylint-2.17.7 pyvcf3-1.0.3 rich-13.9.2 scikit-learn-1.5.2 sercol-1.0.0 serializable-0.4.1 simplejson-3.19.3 tensorboard-2.17.1 tensorboard-data-server-0.7.2 tensorflow-2.17.0 tensorflow-io-gcs-filesystem-0.37.1 termcolor-2.5.0 threadpoolctl-3.5.0 tinytimer-0.0.0 typechecks-0.1.0 varcode-1.2.1

        [notice] A new release of pip is available: 24.0 -> 24.2
        [notice] To update, run: pip install --upgrade pip
        [richel@rackham1 ~]$ pip list
        Package                      Version
        ---------------------------- ---------------
        absl-py                      2.1.0
        anndata                      0.10.5.post1
        anyio                        4.2.0
        [...]
        memoized-property            1.0.3
        mergedeep                    1.3.4
        mhcnuggets                   2.4.1
        mistune                      3.0.2
        mkdocs                       1.5.3
        [...]
        wrapt                        1.16.0
        zipp                         3.17.0
        zope.interface               6.1

        [notice] A new release of pip is available: 24.0 -> 24.2
        [notice] To update, run: pip install --upgrade pip

Conclusion
----------

.. keypoints::

    You have:

    - determined if a Python package is installed yes/no using ``pip``
    - discovered some Python package are already installed upon
      loading a module
    - installed a Python package using ``pip``

    However, the installed package was put into a shared (as in, not isolated)
    environment.

    Luckily, isolated environments are discussed in this course too :-)

..
   _This: is a comment

    .. code-block::

        [richel@rackham3 ~]$ pip list
        Package                   Version
        ------------------------- ---------------
        anndata                   0.10.5.post1
        anyio                     4.2.0
        argon2-cffi               23.1.0
        argon2-cffi-bindings      21.2.0
        array_api_compat          1.4.1
        arrow                     1.3.0
        asteval                   0.9.31
        asttokens                 2.4.1
        async-lru                 2.0.4
        attrs                     23.2.0
        Automat                   22.10.0
        Babel                     2.14.0
        beautifulsoup4            4.12.3
        black                     24.1.1
        bleach                    6.1.0
        blinker                   1.7.0
        build                     1.0.3
        CacheControl              0.13.1
        certifi                   2024.2.2
        cffi                      1.16.0
        cget                      0.2.0
        chardet                   5.2.0
        charset-normalizer        3.3.2
        cleo                      2.1.0
        click                     8.1.7
        cloudpickle               3.0.0
        comm                      0.2.1
        constantly                23.10.4
        contourpy                 1.2.0
        cramjam                   2.8.1
        crashtest                 0.4.1
        cryptography              42.0.2
        cycler                    0.12.1
        Cython                    3.0.8
        dask                      2024.1.1
        debugpy                   1.8.0
        decorator                 5.1.1
        defusedxml                0.7.1
        distlib                   0.3.8
        dulwich                   0.21.7
        et-xmlfile                1.1.0
        executing                 2.0.1
        fastjsonschema            2.19.1
        fastparquet               2023.10.1
        filelock                  3.13.1
        flake8                    7.0.0
        Flask                     3.0.2
        fonttools                 4.48.1
        fqdn                      1.5.1
        fsspec                    2024.2.0
        future                    0.18.3
        ghp-import                2.1.0
        gitdb                     4.0.11
        GitPython                 3.1.41
        graphviz                  0.20.1
        h11                       0.14.0
        h5py                      3.10.0
        httpcore                  1.0.2
        httpx                     0.26.0
        hyperlink                 21.0.0
        idna                      3.6
        importlib-metadata        7.0.1
        incremental               22.10.0
        iniconfig                 2.0.0
        installer                 0.7.0
        iohandler                 1.0.6
        ipykernel                 6.29.2
        ipython                   8.21.0
        ipywidgets                8.1.1
        isoduration               20.11.0
        itsdangerous              2.1.2
        jaraco.classes            3.3.1
        jedi                      0.19.1
        jeepney                   0.8.0
        Jinja2                    3.1.3
        joblib                    1.3.2
        json5                     0.9.14
        jsonpointer               2.4
        jsonschema                4.21.1
        jsonschema-specifications 2023.12.1
        jupyter                   1.0.0
        jupyter_client            8.6.0
        jupyter-console           6.6.3
        jupyter_core              5.7.1
        jupyter-events            0.9.0
        jupyter-lsp               2.2.2
        jupyter_server            2.12.5
        jupyter_server_terminals  0.5.2
        jupyterlab                4.1.0
        jupyterlab_pygments       0.3.0
        jupyterlab_server         2.25.2
        jupyterlab-widgets        3.0.9
        keyring                   24.3.0
        kiwisolver                1.4.5
        lmfit                     1.2.2
        locket                    1.0.0
        Markdown                  3.5.2
        MarkupSafe                2.1.5
        matplotlib                3.8.2
        matplotlib-inline         0.1.6
        mccabe                    0.7.0
        mergedeep                 1.3.4
        mistune                   3.0.2
        mkdocs                    1.5.3
        mock                      5.1.0
        more-itertools            10.2.0
        mpmath                    1.3.0
        msgpack                   1.0.7
        mypy                      1.8.0
        mypy-extensions           1.0.0
        natsort                   8.4.0
        nbclient                  0.9.0
        nbconvert                 7.16.0
        nbformat                  5.9.2
        nest-asyncio              1.6.0
        networkx                  3.2.1
        nltk                      3.8.1
        nose                      1.3.7
        notebook                  7.0.7
        notebook_shim             0.2.3
        numpy                     1.26.4
        openpyxl                  3.1.2
        overrides                 7.7.0
        packaging                 23.2
        pandas                    2.2.0
        pandocfilters             1.5.1
        parso                     0.8.3
        partd                     1.4.1
        pathlib                   1.0.1
        pathspec                  0.12.1
        pexpect                   4.9.0
        pillow                    10.2.0
        pip                       24.0
        pkginfo                   1.9.6
        platformdirs              3.11.0
        pluggy                    1.4.0
        pocl-binary-distribution  3.0
        poetry                    1.7.1
        poetry-core               1.8.1
        poetry-plugin-export      1.6.0
        prometheus-client         0.19.0
        prompt-toolkit            3.0.43
        psutil                    5.9.8
        ptyprocess                0.7.0
        pure-eval                 0.2.2
        pyarrow                   15.0.0
        pybind11                  2.11.1
        pybind11-global           2.11.1
        pycodestyle               2.11.1
        pycparser                 2.21
        pydot                     2.0.0
        pyflakes                  3.2.0
        Pygments                  2.17.2
        pyopencl                  2024.2.7
        pyparsing                 3.1.1
        pyproject_hooks           1.0.0
        PyQt5                     5.15.10
        PyQt5-Qt5                 5.15.2
        PyQt5-sip                 12.13.0
        pysqlite3                 0.5.2
        pytest                    8.0.0
        python-dateutil           2.8.2
        python-graph-core         1.8.2
        python-graph-dot          1.8.2
        python-json-logger        2.0.7
        python_qt_binding         0.3.4
        pytools                   2024.1.14
        pytz                      2024.1
        PyYAML                    6.0.1
        pyyaml_env_tag            0.1
        pyzmq                     25.1.2
        qtconsole                 5.5.1
        qtgui                     0.0.1
        QtPy                      2.4.1
        rapidfuzz                 3.6.1
        referencing               0.33.0
        regex                     2023.12.25
        renderer                  1.0.3
        reportlab                 4.0.9
        requests                  2.31.0
        requests-toolbelt         1.0.0
        rfc3339-validator         0.1.4
        rfc3986-validator         0.1.1
        rpds-py                   0.17.1
        ruamel.yaml               0.18.6
        ruamel.yaml.clib          0.2.8
        scipy                     1.12.0
        SecretStorage             3.3.3
        Send2Trash                1.8.2
        setuptools                69.0.3
        shellingham               1.5.4
        singledispatch            4.1.0
        siphash24                 1.6
        six                       1.16.0
        smmap                     5.0.1
        sniffio                   1.3.0
        soupsieve                 2.5
        spython                   0.3.13
        stack-data                0.6.3
        structlog                 24.1.0
        sympy                     1.12
        terminado                 0.18.0
        tinycss2                  1.2.1
        tomlkit                   0.12.3
        toolz                     0.12.1
        tornado                   6.4
        tqdm                      4.66.1
        traitlets                 5.14.1
        trove-classifiers         2024.1.31
        Twisted                   23.10.0
        types-python-dateutil     2.8.19.20240106
        typing                    3.7.4.3
        typing_extensions         4.9.0
        tzdata                    2023.4
        uncertainties             3.1.7
        uri-template              1.3.0
        urllib3                   2.2.0
        virtualenv                20.25.0
        watchdog                  4.0.0
        wcwidth                   0.2.13
        webcolors                 1.13
        webencodings              0.5.1
        websocket-client          1.7.0
        Werkzeug                  3.0.1
        wheel                     0.42.0
        widgetsnbextension        4.0.9
        wrapt                     1.16.0
        zipp                      3.17.0
        zope.interface            6.1



    .. code-block::

        b-an01 [~]$ module load GCC/12.3.0
        b-an01 [~]$ module load Python/3.11.3
        b-an01 [~]$ pip list
        Package           Version
        ----------------- -------
        flit_core         3.9.0
        packaging         23.1
        pip               23.1.2
        setuptools        67.7.2
        setuptools-scm    7.1.0
        tomli             2.0.1
        typing_extensions 4.6.3
        wheel             0.40.0

    However, loading ``SciPy-bundle/2023.11`` gives ``pandas``:

    .. code-block::

        b-an01 [~]$ module purge
        The following modules were not unloaded:
          (Use "module --force purge" to unload all):

          1) snicenvironment   2) systemdefault
        b-an01 [~]$ module load GCC/13.2.0
        b-an01 [~]$ module load SciPy-bundle/2023.11
        b-an01 [~]$ module list

        Currently Loaded Modules:
          1) snicenvironment (S)   4) zlib/1.2.13     7) OpenBLAS/0.3.24  10) bzip2/1.0.8      13) Tcl/8.6.13     16) libffi/3.4.4   19) cffi/1.15.1          22) Python-bundle-PyPI/2023.10
          2) systemdefault   (S)   5) binutils/2.40   8) FlexiBLAS/3.3.1  11) ncurses/6.4      14) SQLite/3.43.1  17) OpenSSL/1.1    20) cryptography/41.0.5  23) pybind11/2.11.1
          3) GCCcore/13.2.0        6) GCC/13.2.0      9) FFTW/3.3.10      12) libreadline/8.2  15) XZ/5.4.4       18) Python/3.11.5  21) virtualenv/20.24.6   24) SciPy-bundle/2023.11

          Where:
           S:  Module is Sticky, requires --force to unload or purge

        b-an01 [~]$ pip list
        Package                           Version
        --------------------------------- ------------
        alabaster                         0.7.13
        appdirs                           1.4.4
        asn1crypto                        1.5.1
        atomicwrites                      1.4.1
        attrs                             23.1.0
        Babel                             2.13.1
        backports.entry-points-selectable 1.2.0
        backports.functools-lru-cache     1.6.6
        beniget                           0.4.1
        bitarray                          2.8.2
        bitstring                         4.1.2
        blist                             1.3.6
        Bottleneck                        1.3.7
        CacheControl                      0.13.1
        cachy                             0.3.0
        certifi                           2023.7.22
        cffi                              1.16.0
        chardet                           5.2.0
        charset-normalizer                3.3.1
        cleo                              2.0.1
        click                             8.1.7
        cloudpickle                       3.0.0
        colorama                          0.4.6
        commonmark                        0.9.1
        crashtest                         0.4.1
        cryptography                      41.0.5
        Cython                            3.0.4
        deap                              1.4.1
        decorator                         5.1.1
        distlib                           0.3.7
        distro                            1.8.0
        docopt                            0.6.2
        docutils                          0.20.1
        doit                              0.36.0
        dulwich                           0.21.6
        ecdsa                             0.18.0
        editables                         0.5
        exceptiongroup                    1.1.3
        execnet                           2.0.2
        filelock                          3.13.0
        flit_core                         3.9.0
        fsspec                            2023.10.0
        future                            0.18.3
        gast                              0.5.4
        glob2                             0.7
        html5lib                          1.1
        idna                              3.4
        imagesize                         1.4.1
        importlib-metadata                6.8.0
        importlib-resources               6.1.0
        iniconfig                         2.0.0
        intervaltree                      3.1.0
        intreehooks                       1.0
        ipaddress                         1.0.23
        jaraco.classes                    3.3.0
        jeepney                           0.8.0
        Jinja2                            3.1.2
        joblib                            1.3.2
        jsonschema                        4.17.3
        keyring                           24.2.0
        keyrings.alt                      5.0.0
        liac-arff                         2.5.0
        lockfile                          0.12.2
        markdown-it-py                    3.0.0
        MarkupSafe                        2.1.3
        mdurl                             0.1.2
        mock                              5.1.0
        more-itertools                    10.1.0
        mpmath                            1.3.0
        msgpack                           1.0.7
        netaddr                           0.9.0
        netifaces                         0.11.0
        numexpr                           2.8.7
        numpy                             1.26.2
        packaging                         23.2
        pandas                            2.1.3
        pastel                            0.2.1
        pathlib2                          2.3.7.post1
        pathspec                          0.11.2
        pbr                               5.11.1
        pexpect                           4.8.0
        pip                               23.2.1
        pkginfo                           1.9.6
        platformdirs                      3.11.0
        pluggy                            1.3.0
        ply                               3.11
        pooch                             1.8.0
        psutil                            5.9.6
        ptyprocess                        0.7.0
        py                                1.11.0
        py-expression-eval                0.3.14
        pyasn1                            0.5.0
        pybind11                          2.11.1
        pycparser                         2.21
        pycryptodome                      3.19.0
        pydevtool                         0.3.0
        Pygments                          2.16.1
        pylev                             1.4.0
        PyNaCl                            1.5.0
        pyparsing                         3.1.1
        pyrsistent                        0.20.0
        pytest                            7.4.3
        pytest-xdist                      3.3.1
        python-dateutil                   2.8.2
        pythran                           0.14.0
        pytoml                            0.1.21
        pytz                              2023.3.post1
        rapidfuzz                         2.15.2
        regex                             2023.10.3
        requests                          2.31.0
        requests-toolbelt                 1.0.0
        rich                              13.6.0
        rich-click                        1.7.0
        scandir                           1.10.0
        scipy                             1.11.4
        SecretStorage                     3.3.3
        semantic-version                  2.10.0
        setuptools                        68.2.2
        setuptools-scm                    8.0.4
        shellingham                       1.5.4
        simplegeneric                     0.8.1
        simplejson                        3.19.2
        six                               1.16.0
        snowballstemmer                   2.2.0
        sortedcontainers                  2.4.0
        Sphinx                            7.2.6
        sphinx-bootstrap-theme            0.8.1
        sphinxcontrib-applehelp           1.0.7
        sphinxcontrib-devhelp             1.0.5
        sphinxcontrib-htmlhelp            2.0.4
        sphinxcontrib-jsmath              1.0.1
        sphinxcontrib-qthelp              1.0.6
        sphinxcontrib-serializinghtml     1.1.9
        sphinxcontrib-websupport          1.2.6
        tabulate                          0.9.0
        threadpoolctl                     3.2.0
        toml                              0.10.2
        tomli                             2.0.1
        tomli_w                           1.0.0
        tomlkit                           0.12.1
        typing_extensions                 4.8.0
        tzdata                            2023.3
        ujson                             5.8.0
        urllib3                           2.0.7
        versioneer                        0.29
        virtualenv                        20.24.6
        wcwidth                           0.2.8
        webencodings                      0.5.1
        wheel                             0.41.2
        xlrd                              2.0.1
        zipfile36                         0.1.3
        zipp                              3.17.0

