# R, Python, Julia, and MATLAB in HPC

[![Check links](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/check_links.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/check_links.yaml)
[![Check spelling](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/check_spelling.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/check_spelling.yaml)
[![Create website](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/create_website.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/create_website.yaml)

This repository contains the source code for the UPPMAX/HPC2N [R, Python, Julia, and Matlab in HPC course](https://uppmax.github.io/R-python-julia-matlab-HPC/)

This 4-day course is not given any longer. Instead we refer to this course for [R, Matlab and Julia](https://github.com/UPPMAX/R-matlab-julia-HPC), or for [HPC-Python](https://github.com/UPPMAX/HPC-python/tree/main)

## Getting PDFs of the material

You can clone the repository: ``git clone https://github.com/UPPMAX/R-python-julia-matlab-HPC.git``

After doing that, you can convert the .rst files to .pdf files with this online tool: https://cloudconvert.com/rst-to-pdf 

The documentation files you see on the rendered pages (https://uppmax.github.io/R-python-julia-matlab-HPC/) are found under ``R-python-julia-matlab-HPC/docs/<language>``.

## Credits

Built with Sphinx using a theme provided by Read the Docs. 

## Files used by continuous integration scripts

Filename                           |Descriptions
-----------------------------------|------------------------------------------------------------------------------------------------------
[.lycheeignore](.lycheeignore)     |URLs ignored by the link checker
[.spellcheck.yml](.spellcheck.yml) |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)     |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally

## Links

 * [online ReStructedText table editor and generator](https://tableconvert.com/restructuredtext-generator)
