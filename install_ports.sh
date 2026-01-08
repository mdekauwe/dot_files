#!/bin/bash

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
$PORT install $GCC_VER +gfortran
sudo port select --set gcc mp-$GCC_VER

# -------------------------------
# OpenMPI for MPI support
# -------------------------------
$PORT install openmpi +fortran
$PORT select --set mpi openmpi-mp-fortran

# -------------------------------
# NetCDF libraries
# -------------------------------
# NetCDF C and Fortran (use GCC for Fortran only)
$PORT install netcdf
$PORT install netcdf-fortran +$GCC_VER

# NetCDF C++ (use Apple Clang)
$PORT install netcdf-cxx4
$PORT install netcdf-cxx

# -------------------------------
# Python and scientific stack
# -------------------------------
PY_VER=py313
VER=313

$PORT install python$VER
$PORT select --set python python$VER

# Scientific Python packages
$PORT install $PY_VER-numpy
$PORT install $PY_VER-cython
$PORT install $PY_VER-ipython
$PORT select --set ipython $PY_VER-ipython
$PORT install $PY_VER-scipy
$PORT install $PY_VER-pandas
$PORT install $PY_VER-xarray
$PORT install $PY_VER-matplotlib
$PORT install $PY_VER-cartopy
$PORT install $PY_VER-jupyter
$PORT install $PY_VER-gdal
$PORT install $PY_VER-pymc
$PORT install $PY_VER-scikit-learn
$PORT install $PY_VER-seaborn
$PORT install $PY_VER-statsmodels
$PORT install $PY_VER-urllib3
$PORT install $PY_VER-xlrd
$PORT install $PY_VER-pip
$PORT -f activate $PY_VER-pip
$PORT select --set pip pip$VER
$PORT install $PY_VER-lmfit
$PORT install $PY_VER-tabulate
$PORT install $PY_VER-sympy
$PORT select --set py-sympy $PY_VER-sympy

# Python MPI (use OpenMPI, NOT MPICH)
$PORT install $PY_VER-mpi4py +openmpi

# Other Python packages via pip
sudo pip install pygam openpyxl earthengine-api xee geemap pingouin \
                 metomi-rose cylc-flow cylc-rose

# -------------------------------
# Other scientific and system tools
# -------------------------------
$PORT install aspell aspell-dict-en
$PORT install hdf5 +fortran

# some issue related to C++20
#$PORT install R gnuplot cdo +

#conda create -n geo cdo netcdf4 hdf5 -c conda-forge
#conda activate geo
#sudo pip install cdo  # Python wrapper

$PORT install R
$PORT install gnuplot
$PORT install coreutils
$PORT install nco
$PORT install wget
$PORT install ncview
#$PORT install gsl
#$PY_VER-gsl


$PORT install texlive-basic
$PORT install texlive-bibtex-extra
$PORT install texlive-fonts-extra
$PORT install texlive-latex-recommended
$PORT install texlive-math-science
$PORT install texlive-publishers
$PORT install texlive-xetex
$PORT install latexmk
$PORT install latexdiff
$PORT install fondu
$PORT install bash-completion
$PORT install bzip2
$PORT install dos2unix
$PORT install fortune
$PORT install gawk
#$PORT install gdm
$PORT install gdbm
$PORT install geos
$PORT install ImageMagick
$PORT install xorg-server
$PORT install xorg
$PORT install cabal
$PORT install subversion
$PORT install ruby30
$PORT select --set ruby ruby30
sudo gem install bundler jekyll
$PORT install gh

# -------------------------------
# End of script
# -------------------------------
echo "All MacPorts installations complete!"
