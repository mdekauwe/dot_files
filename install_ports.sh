#!/bin/bash

# Get port list port -qv installed > myports.txt
sudo port selfupdate
GCC_VER=gcc10
sudo port install $GCC_VER +gfortran
sudo port select --set gcc mp-$GCC_VER
sudo port install mpich
sudo port select --set mpi mpich-mp-fortran
sudo port install mpich-$GCC_VER
sudo port select --set mpi mpich-gcc10-fortran
sudo port install netcdf
sudo port install netcdf-fortran +$GCC_VER
sudo port install netcdf-cxx4
sudo port install netcdf-cxx
sudo port install openmpi
sudo port select --set mpi openmpi-mp-fortran
sudo port install git
sudo port install python38
sudo port select --set python python38
PY_VER=py38
sudo port install $PY_VER-numpy
sudo port select --set cython cython38
sudo port install $PY_VER-ipython
sudo port select --set ipython $PY_VER-ipython
sudo port install $PY_VER-scipy
sudo port install $PY_VER-pandas
sudo port install $PY_VER-xarray
sudo port install $PY_VER-matplotlib
sudo port install $PY_VER-matplotlib-basemap
sudo port install $PY_VER-cartopy
sudo port install $PY_VER-beautifulsoup4
sudo port install $PY_VER-jupyter
sudo port install gdal
sudo port install $PY_VER-gdal
sudo port install $PY_VER-mpi4py
sudo port install $PY_VER-pymc3
sudo port install $PY_VER-scikit-learn
sudo port install $PY_VER-seaborn
sudo port install $PY_VER-statsmodels
sudo port install $PY_VER-urllib3
sudo port install $PY_VER-xlrd
sudo port install $PY_VER-pip
sudo port -f activate $PY_VER-pip
sudo port select --set pip pip38
sudo port install $PY_VER-lmfit
sudo port install $PY_VER-tabulate
sudo port install $PY_VER-sympy
sudo port select --set py-sympy $PY_VER-symp
sudo port select --set py-sympy py38-sympy
sudo port install aspell
sudo port install aspell-dict-en
#sudo pip install netCDF4
sudo port install $PY_VER-netCDF4
sudo port install R
sudo port install gnuplot
sudo pip install pygam
sudo port install cdo
sudo port install coreutils
sudo port install nco
sudo port install wget
sudo port install ncview
sudo port install gsl
sudo port install $PY_VER-gsl
sudo port install texlive-basic
sudo port install texlive-bibtex-extra
sudo port install texlive-fonts-extra
sudo port install texlive-latex-recommended
sudo port install texlive-math-science
sudo port install texlive-publishers
sudo port install texlive-xetex
sudo port install latexmk
sudo port install fondu
sudo port install bash-completion
sudo port install bzip2
sudo port install dos2unix
sudo port install fortune
sudo port install gawk
sudo port install gdm
sudo port install gdbm
sudo port install geos
sudo port install ImageMagick
sudo port install llvm-7.0
sudo port install xorg-server
sudo port install xorg
sudo port install latexdiff
