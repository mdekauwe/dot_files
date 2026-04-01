#!/bin/bash

#I think if we change $PORT -N install it would remove the yes/no; test

set -euo pipefail

# Ask for sudo once
sudo -v

# Keep sudo alive while the script runs
while true; do sudo -n true; sleep 60; done 2>/dev/null &

# MacPorts command
PORT="sudo port"

# Update ports tree
$PORT selfupdate

# -------------------------------
# GCC for Fortran only
# -------------------------------
GCC_VER=gcc15
$PORT -N install $GCC_VER +gfortran
$PORT select --set gcc mp-$GCC_VER

$PORT -N install clang-20
$PORT -N install boost181
#sudo port install boost181 configure.compiler=macports-clang-20

# -------------------------------
# OpenMPI for MPI support
# -------------------------------
$PORT -N install openmpi +fortran
$PORT select --set mpi openmpi-mp-fortran

# -------------------------------
# NetCDF libraries
# -------------------------------
# NetCDF C and Fortran (use GCC for Fortran only)
$PORT -N install netcdf
$PORT -N install netcdf-fortran +$GCC_VER

# NetCDF C++ (use Apple Clang)
$PORT -N install netcdf-cxx4
$PORT -N install netcdf-cxx

# -------------------------------
# Python and scientific stack
# -------------------------------
PY_VER=py313
VER=313

$PORT -N install python$VER
$PORT select --set python python$VER



# Scientific Python packages
$PORT -N install $PY_VER-numpy
$PORT -N install $PY_VER-scipy
$PORT -N install $PY_VER-cython
$PORT -N install $PY_VER-ipython
$PORT select --set ipython $PY_VER-ipython
$PORT -N install $PY_VER-pandas
$PORT -N install $PY_VER-xarray
$PORT -N install $PY_VER-matplotlib
$PORT -N install $PY_VER-cartopy
$PORT -N install $PY_VER-jupyter
$PORT -N install $PY_VER-gdal
$PORT -N install $PY_VER-pymc
$PORT -N install $PY_VER-scikit-learn
$PORT -N install $PY_VER-seaborn
$PORT -N install $PY_VER-statsmodels
$PORT -N install $PY_VER-urllib3
$PORT -N install $PY_VER-xlrd
$PORT -N install $PY_VER-pip
$PORT -f activate $PY_VER-pip
$PORT select --set pip pip$VER
$PORT -N install $PY_VER-lmfit
$PORT -N install $PY_VER-tabulate
$PORT -N install $PY_VER-sympy
$PORT select --set py-sympy $PY_VER-sympy

# Python MPI (use OpenMPI, NOT MPICH)
$PORT -N install $PY_VER-mpi4py +openmpi

# Other Python packages via pip
sudo pip install pygam openpyxl earthengine-api xee geemap pingouin \
                 metomi-rose cylc-flow cylc-rose

# -------------------------------
# Other scientific and system tools
# -------------------------------
$PORT -N install aspell aspell-dict-en
$PORT -N install hdf5 +fortran

# some issue related to C++20
#$PORT -N install R gnuplot cdo +

#conda create -n geo cdo netcdf4 hdf5 -c conda-forge
#conda activate geo
#sudo pip install cdo  # Python wrapper

$PORT -N install R
$PORT -N install gnuplot
$PORT -N install coreutils
$PORT -N install nco
$PORT -N install wget
$PORT -N install ncview
#$PORT -N install gsl
#$PY_VER-gsl


$PORT -N install texlive-basic
$PORT -N install texlive-bibtex-extra
$PORT -N install texlive-fonts-extra
$PORT -N install texlive-latex-recommended
$PORT -N install texlive-lang-greek
$PORT -N install texlive-math-science
$PORT -N install texlive-publishers
$PORT -N install texlive-xetex
$PORT -N install latexmk
$PORT -N install latexdiff
$PORT -N install fondu
$PORT -N install bash-completion
$PORT -N install bzip2
$PORT -N install dos2unix
$PORT -N install fortune
$PORT -N install gawk
#$PORT -N install gdm
$PORT -N install gdbm
$PORT -N install geos
$PORT -N install ImageMagick
$PORT -N install xorg-server
$PORT -N install xorg
$PORT -N install cabal
$PORT -N install subversion
$PORT -N install ruby30
$PORT select --set ruby ruby30
sudo gem install bundler jekyll
$PORT -N install gh

# -------------------------------
# End of script
# -------------------------------
echo "All MacPorts installations complete!"
