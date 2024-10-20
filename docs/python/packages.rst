Packages
========

.. tabs::

    .. tab:: Learning objectives

        - practice to determine the version of a Python package 
        - practice to determine that a Python package is not installed
        - practice to have loaded a Python machine learning module
        - practice to install a Python package

    .. tab:: For teachers

        Teaching goals are:

        - Learners have determined the version of a Python package 
        - Learners have determined that a Python package is not installed
        - Learners have loaded a Python machine learning module
        - Learners have installed a Python package

        Lesson plan (45 minutes in total):

        - 5 mins: prior knowledge
            - What are Python packages?
            - Why use Python packages?
            - How to find out if a package is already installed?
            - What are some Python package installers?
            - What are the differences?
            - What are some Python package installers used on UPPMAX?
            - What are some Python package installers used on HPC2N?
        - 5 mins: presentation
        - 20 mins: challenge
        - 5 mins: feedback
            - What are Python packages?
            - Why use Python packages?
            - How to find out if a package is already installed?
            - What are some Python package installers?
            - What are the differences?
            - What are some Python package installers used on UPPMAX?
            - What are some Python package installers used on HPC2N?

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

- In exercise 1, we determine if a Python package is already installed
- In exercise 2, we determine if a machine learning Python package is already installed
- If all fails, in exercise 3, we install a Python package ourselves

Like any user, we'll try to be autonomous and read the -hopefully well written!-
UPPMAX documentation.

Exercise 1: loading a Python package that comes with the Python module
----------------------------------------------------------------------

.. admonition:: Learning objectives

    - Practice reading documentation
    - Apply/rehearse the documentation to load a module
    - Apply the documentation to show if a Python package is already installed
    - Observe how it looks like when a package is not installed

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

.. dropdown:: Answer

    - HPC2N: ``module load GCC/12.3.0 Python/3.11.3``
    - LUNARC: TODO
    - UPPMAX: ``module load python/3.11.8``

How to determine if a Python package is installed?

.. dropdown:: Answer

    There are multiple ways. One easy one, is, in a terminal, type:

    .. code-block::

        pip list

The Python package ``wheels`` is known to be installed. Which version?

.. dropdown:: Answer

    When doing ``pip list``, look for ``wheels`` in the list.
    You'll find the following:

    - HPC2N: ``v0.42.0``
    - LUNARC: Unknown.
    - UPPMAX: ``0.40.0``

Exercise 2: loading a Python package that comes with a module
-------------------------------------------------------------

.. admonition:: Learning objectives

    - Practice reading documentation
    - Rehearse the documentation to load a Python machine learning module
    - Apply the documentation to show if a Python package is already installed
    - Observe how it looks like when a package is not installed

Some Python packages need another module to be loaded.
In this exercise, we search for and use a module to use a pre-installed
Python package.
The Python package we use differs by center:

- HPC2N: Theano
- LUNARC: Unknown
- UPPMAX: TensorFlow (as a Python package for CPU)

Use your center's documentation to find out which module to load your Python
package with.

.. dropdown:: Answer

    Search the module system with these commands    

    - HPC2N: Searching for 'Theano' at `the HPC2N documentation <https://www.hpc2n.umu.se/>`
      takes one to `the Theano page <https://www.hpc2n.umu.se/resources/software/theano>`_
    - LUNARC: TODO
    - UPPMAX: searching for ``TensorFlow`` at 
      `the UPPMAX documentation <https://docs.uppmax.uu.se>`_
      takes you to
      `the TensorFlow page <https://docs.uppmax.uu.se/software/tensorflow>`_.
      There, clicking on 'TensorFlow as a Python package for CPU' takes you to
      the header `TensorFlow as a Python package for CPU <https://docs.uppmax.uu.se/software/tensorflow/#tensorflow-as-a-python-package-for-cpu>`_.


Load the module for the Python package and verify if it is loaded.

.. dropdown:: Answer

    Search the module system with these commands    

    - HPC2N: ``module spider Theano`` redirects you to 
      ``module spider Theano/1.1.2-PyMC``. There, follow the instructions:
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
            atomicwrites                  1.4.0
            attrs                         20.2.0
            Babel                         2.8.0
            bcrypt                        3.2.0
            bitstring                     3.1.7
            blist                         1.3.6
            Bottleneck                    1.3.2
            CacheControl                  0.12.6
            cachy                         0.3.0
            certifi                       2020.6.20
            cffi                          1.14.3
            chardet                       3.0.4
            cleo                          0.8.1
            click                         7.1.2
            clikit                        0.6.2
            colorama                      0.4.3
            crashtest                     0.3.1
            cryptography                  3.1.1
            Cython                        0.29.21
            deap                          1.3.1
            decorator                     4.4.2
            distlib                       0.3.1
            docopt                        0.6.2
            docutils                      0.16
            ecdsa                         0.16.0
            filelock                      3.0.12
            flit                          3.0.0
            flit-core                     3.0.0
            fsspec                        0.8.4
            future                        0.18.2
            html5lib                      1.1
            idna                          2.10
            imagesize                     1.2.0
            importlib-metadata            2.0.0
            iniconfig                     1.0.1
            intervaltree                  3.1.0
            intreehooks                   1.0
            ipaddress                     1.0.23
            jeepney                       0.4.3
            Jinja2                        2.11.2
            joblib                        0.17.0
            jsonschema                    3.2.0
            keyring                       21.4.0
            keyrings.alt                  4.0.0
            liac-arff                     2.5.0
            lockfile                      0.12.2
            MarkupSafe                    1.1.1
            mock                          4.0.2
            more-itertools                8.5.0
            mpi4py                        3.0.3
            mpmath                        1.1.0
            msgpack                       1.0.0
            netaddr                       0.8.0
            netifaces                     0.10.9
            nose                          1.3.7
            numexpr                       2.7.1
            numpy                         1.19.4
            packaging                     20.4
            pandas                        1.1.4
            paramiko                      2.7.2
            pastel                        0.2.1
            pathlib2                      2.3.5
            paycheck                      1.0.2
            pbr                           5.5.0
            pexpect                       4.8.0
            pip                           20.2.3
            pkginfo                       1.5.0.1
            pluggy                        0.13.1
            poetry                        1.1.3
            poetry-core                   1.0.0
            psutil                        5.7.2
            ptyprocess                    0.6.0
            py                            1.9.0
            py-expression-eval            0.3.10
            pyasn1                        0.4.8
            pybind11                      2.6.0
            pycparser                     2.20
            pycrypto                      2.6.1
            Pygments                      2.7.1
            pylev                         1.3.0
            PyNaCl                        1.4.0
            pyparsing                     2.4.7
            pyrsistent                    0.17.3
            pytest                        6.1.1
            python-dateutil               2.8.1
            pytoml                        0.1.21
            pytz                          2020.1
            regex                         2020.10.11
            requests                      2.24.0
            requests-toolbelt             0.9.1
            scandir                       1.10.0
            scipy                         1.5.4
            SecretStorage                 3.1.2
            setuptools                    50.3.0
            setuptools-scm                4.1.2
            shellingham                   1.3.2
            simplegeneric                 0.8.1
            simplejson                    3.17.2
            six                           1.15.0
            snowballstemmer               2.0.0
            sortedcontainers              2.2.2
            Sphinx                        3.2.1
            sphinx-bootstrap-theme        0.7.1
            sphinxcontrib-applehelp       1.0.2
            sphinxcontrib-devhelp         1.0.2
            sphinxcontrib-htmlhelp        1.0.3
            sphinxcontrib-jsmath          1.0.1
            sphinxcontrib-qthelp          1.0.3
            sphinxcontrib-serializinghtml 1.1.4
            sphinxcontrib-websupport      1.2.4
            tabulate                      0.8.7
            Theano-PyMC                   1.1.2
            threadpoolctl                 2.1.0
            toml                          0.10.1
            tomlkit                       0.7.0
            ujson                         4.0.1
            urllib3                       1.25.10
            virtualenv                    20.0.34
            wcwidth                       0.2.5
            webencodings                  0.5.1
            wheel                         0.35.1
            xlrd                          1.2.0
            zipp                          3.3.0


    - LUNARC: TODO
    - UPPMAX: 
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
            argon2-cffi                  23.1.0
            argon2-cffi-bindings         21.2.0
            array_api_compat             1.4.1
            array_record                 0.5.1
            arrow                        1.3.0
            asteval                      0.9.31
            asttokens                    2.4.1
            astunparse                   1.6.3
            async-lru                    2.0.4
            attrs                        23.2.0
            Automat                      22.10.0
            Babel                        2.14.0
            beautifulsoup4               4.12.3
            black                        24.1.1
            bleach                       6.1.0
            blinker                      1.7.0
            build                        1.0.3
            CacheControl                 0.13.1
            certifi                      2024.2.2
            cffi                         1.16.0
            cget                         0.2.0
            chardet                      5.2.0
            charset-normalizer           3.3.2
            cleo                         2.1.0
            click                        8.1.7
            cloudpickle                  3.0.0
            comm                         0.2.1
            cons                         0.4.6
            constantly                   23.10.4
            contourpy                    1.2.0
            cramjam                      2.8.1
            crashtest                    0.4.1
            cryptography                 42.0.2
            cycler                       0.12.1
            Cython                       3.0.8
            dask                         2024.1.1
            debugpy                      1.8.0
            decorator                    5.1.1
            defusedxml                   0.7.1
            dill                         0.3.8
            distlib                      0.3.8
            dm-tree                      0.1.8
            ducc0                        0.34.0
            dulwich                      0.21.7
            et-xmlfile                   1.1.0
            etils                        1.8.0
            etuples                      0.3.9
            executing                    2.0.1
            fastjsonschema               2.19.1
            fastparquet                  2023.10.1
            filelock                     3.13.1
            flake8                       7.0.0
            Flask                        3.0.2
            flatbuffers                  24.3.25
            fonttools                    4.48.1
            fqdn                         1.5.1
            fsspec                       2024.2.0
            future                       0.18.3
            gast                         0.5.4
            ghp-import                   2.1.0
            gitdb                        4.0.11
            GitPython                    3.1.41
            google-pasta                 0.2.0
            googleapis-common-protos     1.63.0
            graphviz                     0.20.1
            grpcio                       1.63.0
            h11                          0.14.0
            h5py                         3.10.0
            httpcore                     1.0.2
            httpx                        0.26.0
            hyperlink                    21.0.0
            idna                         3.6
            imbalanced-learn             0.12.2
            importlib-metadata           7.0.1
            importlib_resources          6.4.0
            incremental                  22.10.0
            iniconfig                    2.0.0
            installer                    0.7.0
            iohandler                    1.0.6
            ipykernel                    6.29.2
            ipython                      8.21.0
            ipywidgets                   8.1.1
            isoduration                  20.11.0
            itsdangerous                 2.1.2
            jaraco.classes               3.3.1
            jedi                         0.19.1
            jeepney                      0.8.0
            Jinja2                       3.1.3
            joblib                       1.3.2
            json5                        0.9.14
            jsonpointer                  2.4
            jsonschema                   4.21.1
            jsonschema-specifications    2023.12.1
            jupyter                      1.0.0
            jupyter_client               8.6.0
            jupyter-console              6.6.3
            jupyter_core                 5.7.1
            jupyter-events               0.9.0
            jupyter-lsp                  2.2.2
            jupyter_server               2.12.5
            jupyter_server_terminals     0.5.2
            jupyterlab                   4.1.0
            jupyterlab_pygments          0.3.0
            jupyterlab_server            2.25.2
            jupyterlab-widgets           3.0.9
            keras                        3.3.3
            keyring                      24.3.0
            kiwisolver                   1.4.5
            libclang                     18.1.1
            llvmlite                     0.42.0
            lmfit                        1.2.2
            locket                       1.0.0
            logical-unification          0.4.6
            Markdown                     3.5.2
            markdown-it-py               3.0.0
            MarkupSafe                   2.1.5
            matplotlib                   3.8.2
            matplotlib-inline            0.1.6
            mccabe                       0.7.0
            mdurl                        0.1.2
            mergedeep                    1.3.4
            miniKanren                   1.0.3
            mistune                      3.0.2
            mkdocs                       1.5.3
            ml-dtypes                    0.3.2
            mock                         5.1.0
            more-itertools               10.2.0
            mpmath                       1.3.0
            msgpack                      1.0.7
            multipledispatch             1.0.0
            mypy                         1.8.0
            mypy-extensions              1.0.0
            namex                        0.0.8
            natsort                      8.4.0
            nbclient                     0.9.0
            nbconvert                    7.16.0
            nbformat                     5.9.2
            nest-asyncio                 1.6.0
            networkx                     3.2.1
            nlp                          0.4.0
            nltk                         3.8.1
            nose                         1.3.7
            notebook                     7.0.7
            notebook_shim                0.2.3
            numba                        0.59.1
            numpy                        1.26.4
            openpyxl                     3.1.2
            opt-einsum                   3.3.0
            optree                       0.11.0
            overrides                    7.7.0
            packaging                    23.2
            pandas                       2.2.0
            pandocfilters                1.5.1
            parso                        0.8.3
            partd                        1.4.1
            pathlib                      1.0.1
            pathspec                     0.12.1
            patsy                        0.5.6
            pexpect                      4.9.0
            pillow                       10.2.0
            pip                          24.0
            pkginfo                      1.9.6
            platformdirs                 3.11.0
            pluggy                       1.4.0
            pocl-binary-distribution     3.0
            poetry                       1.7.1
            poetry-core                  1.8.1
            poetry-plugin-export         1.6.0
            prometheus-client            0.19.0
            promise                      2.3
            prompt-toolkit               3.0.43
            protobuf                     4.25.3
            psutil                       5.9.8
            ptyprocess                   0.7.0
            pure-eval                    0.2.2
            pyarrow                      15.0.0
            pybind11                     2.11.1
            pybind11-global              2.11.1
            pycodestyle                  2.11.1
            pycparser                    2.21
            pydot                        2.0.0
            pyflakes                     3.2.0
            Pygments                     2.17.2
            pyopencl                     2024.2.7
            pyparsing                    3.1.1
            pyproject_hooks              1.0.0
            PyQt5                        5.15.10
            PyQt5-Qt5                    5.15.2
            PyQt5-sip                    12.13.0
            pysqlite3                    0.5.2
            pytensor                     2.21.0
            pytest                       8.0.0
            python-dateutil              2.8.2
            python-graph-core            1.8.2
            python-graph-dot             1.8.2
            python-json-logger           2.0.7
            python_qt_binding            0.3.4
            pytools                      2024.1.14
            pytz                         2024.1
            PyYAML                       6.0.1
            pyyaml_env_tag               0.1
            pyzmq                        25.1.2
            qtconsole                    5.5.1
            qtgui                        0.0.1
            QtPy                         2.4.1
            rapidfuzz                    3.6.1
            referencing                  0.33.0
            regex                        2023.12.25
            renderer                     1.0.3
            reportlab                    4.0.9
            requests                     2.31.0
            requests-toolbelt            1.0.0
            rfc3339-validator            0.1.4
            rfc3986-validator            0.1.1
            rich                         13.7.1
            rpds-py                      0.17.1
            ruamel.yaml                  0.18.6
            ruamel.yaml.clib             0.2.8
            scikit-learn                 1.4.2
            scipy                        1.12.0
            seaborn                      0.13.2
            SecretStorage                3.3.3
            Send2Trash                   1.8.2
            setuptools                   69.5.1
            shellingham                  1.5.4
            singledispatch               4.1.0
            siphash24                    1.6
            six                          1.16.0
            smmap                        5.0.1
            sniffio                      1.3.0
            soupsieve                    2.5
            spython                      0.3.13
            stack-data                   0.6.3
            statsmodels                  0.14.2
            structlog                    24.1.0
            sympy                        1.12
            tensorboard                  2.16.2
            tensorboard-data-server      0.7.2
            tensorflow-cpu               2.16.1
            tensorflow-datasets          4.9.4
            tensorflow-io-gcs-filesystem 0.37.0
            tensorflow-metadata          1.15.0
            tensorflow-probability       0.24.0
            termcolor                    2.4.0
            terminado                    0.18.0
            threadpoolctl                3.5.0
            tinycss2                     1.2.1
            toml                         0.10.2
            tomlkit                      0.12.3
            toolz                        0.12.1
            torch                        2.3.0+cpu
            torchaudio                   2.3.0+cpu
            torchvision                  0.18.0+cpu
            tornado                      6.4
            tqdm                         4.66.1
            traitlets                    5.14.1
            trove-classifiers            2024.1.31
            Twisted                      23.10.0
            types-python-dateutil        2.8.19.20240106
            typing                       3.7.4.3
            typing_extensions            4.9.0
            tzdata                       2023.4
            uncertainties                3.1.7
            uri-template                 1.3.0
            urllib3                      2.2.0
            virtualenv                   20.25.0
            watchdog                     4.0.0
            wcwidth                      0.2.13
            webcolors                    1.13
            webencodings                 0.5.1
            websocket-client             1.7.0
            Werkzeug                     3.0.1
            wheel                        0.43.0
            widgetsnbextension           4.0.9
            wrapt                        1.16.0
            xxhash                       3.4.1
            zipp                         3.17.0
            zope.interface               6.1

Exercise 3
----------

.. admonition:: Learning objectives

    - Practice reading documentation
    - Install a new package.
    - Rehearse determining if a Python package is already installed

Imagine you want to use the Python packages ``pandas`` and ``tensorflow-cpu`` and ``mhcnuggets``.
Even when loading a bigger module, one of the packages was not installed for us.
Here we install a Python package ourselves.

.. tabs::

    .. tab:: Exercise 3.1

        Read `the UPPMAX documentation on how to install Python packages using pip <http://docs.uppmax.uu.se/software/python_install_packages/#pip>`_.

        We will be using the first install with ``--user``.

        In which folder do the Python packages end up?

        Try to come up with a reason why would this be important to know.

    .. tab:: Answer

        When using ``--user``, your Python packages end up in the ``.local`` folder.

        This can be important, because it will always be present.
        That is, it is not part of an isolated environment.
        If you, for example, work in an 'isolated' environment and
        run into problems with Python package versions that are not part of it,
        it is probably those packages in your ``.local`` folder.
        This can be solved by removing that ``.local`` folder.

        Note that on UPPMAX, one can omit the ``--user`` flag, 
        as it is added automatically, as is shown in a warning.

.. tabs::

    .. tab:: Exercise 3.2

        Install the package ``mhcnuggets``.

    .. tab:: Answer

        Do:

        .. code-block::

            pip install --user mhcnuggets

.. tabs::

    .. tab:: Exercise 3.3

        Confirm that the Python package ``mhcnuggets`` is installed now.
        Which version has been installed?

    .. tab:: Answer

        Do:

        .. code-block::

            pip list

        In the list, one can find ``mhcnuggets``, with version ``2.4.1``

        So, yes, the Python package ``mhcnuggets`` is now installed!

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

