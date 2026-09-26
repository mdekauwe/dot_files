#!/bin/bash
#
# Install MacPorts packages for scientific work.
# Safe to re-run: `port install` skips anything already installed.

set -euo pipefail

# -------------------------------
# Versions
# -------------------------------
GCC_VER=gcc15
PY_VER=py313
VER=313
RUBY_VER=ruby33

# Pip-only Python packages go in a venv, NOT MacPorts' site-packages.
# `sudo pip install` into /opt/local overwrites port-owned files (e.g. an
# old scipy got layered over py313-scipy and broke scipy.spatial).
VENV="$HOME/.venvs/sci"

PORT="sudo port -N"   # -N: non-interactive

# Stale C++ headers from old Command Line Tools break C++ source builds
# ("fatal error: 'string' file not found"). See:
# https://trac.macports.org/wiki/ProblemHotlist#clts16
if [ -d /Library/Developer/CommandLineTools/usr/include/c++ ]; then
    echo "Old C++ headers found; remove them first with:"
    echo "  sudo rm -rf /Library/Developer/CommandLineTools/usr/include/c++"
    exit 1
fi

# Ask for sudo once and keep it alive; kill the keep-alive on exit
sudo -v
while true; do sudo -n true; sleep 60; done 2>/dev/null &
SUDO_PID=$!
trap 'kill $SUDO_PID 2>/dev/null' EXIT

$PORT selfupdate

# -------------------------------
# Compilers, MPI, NetCDF
# -------------------------------
# GCC for Fortran only
$PORT install $GCC_VER
$PORT select --set gcc mp-$GCC_VER

# MacPorts clang and boost
$PORT install clang-20 boost181
#$PORT install boost181 configure.compiler=macports-clang-20

# OpenMPI (NOT MPICH); Fortran bindings come from openmpi-default +gcc15
$PORT install openmpi
$PORT select --set mpi openmpi-mp-fortran

# NetCDF C/Fortran (GCC for Fortran), C++ (Apple Clang)
$PORT install hdf5 +fortran netcdf netcdf-fortran +$GCC_VER
$PORT install netcdf-cxx4 netcdf-cxx

# -------------------------------
# Python and scientific stack
# -------------------------------
$PORT install python$VER
$PORT select --set python python$VER
$PORT select --set python3 python$VER

PY_PORTS=(
    numpy scipy cython ipython pandas xarray matplotlib cartopy jupyter
    gdal pymc scikit-learn seaborn statsmodels urllib3 xlrd openpyxl pip
    lmfit tabulate sympy netcdf4
)
$PORT install "${PY_PORTS[@]/#/$PY_VER-}"
$PORT install $PY_VER-mpi4py +openmpi

$PORT select --set ipython $PY_VER-ipython
$PORT select --set ipython3 $PY_VER-ipython
$PORT select --set pip pip$VER
$PORT select --set py-sympy $PY_VER-sympy

# Pip-only packages (no MacPorts port) go in a virtualenv.
#
# Why: MacPorts owns every file in its site-packages. `sudo pip install`
# writes into that same folder, and when a pip package pulls in a
# dependency (e.g. pygam -> scipy) pip overwrites MacPorts' copy with its
# own. MacPorts doesn't know, so the next `port upgrade` leaves a mix of
# old and new files -- that's what broke scipy.spatial and pyarrow.
#
# A virtualenv is just a folder ($VENV) with its own python/pip. Anything
# pip installs lands there, so MacPorts files are never touched and the
# whole thing can be deleted and rebuilt (rm -rf $VENV; re-run this
# section). --system-site-packages lets it still import the MacPorts
# numpy/scipy/pandas etc., so nothing is installed twice.
#
# ~/.bash_profile activates it in every new shell, so `python`, `pip`,
# `cylc`, `rose` all come from the venv. Manual use:
#   source ~/.venvs/sci/bin/activate    # turn on
#   deactivate                          # turn off
/opt/local/bin/python3.${VER#3} -m venv --system-site-packages "$VENV"
"$VENV/bin/pip" install --upgrade pip
"$VENV/bin/pip" install pygam pingouin earthengine-api xee geemap \
                        metomi-rose cylc-flow cylc-rose

# -------------------------------
# Other scientific and system tools
# -------------------------------
# cdo: C++20 build issue, use conda if needed:
#   conda create -n geo cdo netcdf4 hdf5 -c conda-forge
$PORT install R gnuplot nco ncview geos

$PORT install \
    texlive-basic texlive-bibtex-extra texlive-fonts-extra \
    texlive-latex-recommended texlive-lang-greek texlive-math-science \
    texlive-publishers texlive-xetex latexmk latexdiff fondu \
    aspell aspell-dict-en

$PORT install \
    coreutils wget bash-completion bzip2 dos2unix fortune gawk gdbm \
    ImageMagick xorg-server xorg cabal subversion gh

$PORT install $RUBY_VER
$PORT select --set ruby $RUBY_VER
sudo /opt/local/bin/gem3.${RUBY_VER#ruby3} install bundler jekyll

echo "All MacPorts installations complete!"
