# R, Python, Julia, and MATLAB in HPC

[![Check links](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/check_links.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/check_links.yaml)
[![Check spelling](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/check_spelling.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/check_spelling.yaml)
[![Create website](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/create_website.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-python-julia-matlab-HPC/actions/workflows/create_website.yaml)

This repository contains the source code for the UPPMAX/HPC2N [R, Python, Julia, and Matlab in HPC course](https://uppmax.github.io/R-python-julia-matlab-HPC/)

## Credits

Built with Sphinx using a theme provided by Read the Docs. 

## Files used by continuous integration scripts

Filename                           |Descriptions
-----------------------------------|------------------------------------------------------------------------------------------------------
[mlc_config.json](mlc_config.json) |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` and `markdown-link-check --config mlc_config.json ./docs/**/*.rst` to do link checking locally
[.spellcheck.yml](.spellcheck.yml) |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)     |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally

## Links

 * [online ReStructedText table editor and generator](https://tableconvert.com/restructuredtext-generator)
