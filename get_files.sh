#!/bin/bash

FDIR="bash"
cp ~/.bashrc $FDIR/bashrc
cp ~/.bash_profile $FDIR/bash_profile

FDIR="spell"
cp ~/.aspell.en.prepl $FDIR/aspell.en.prepl
cp ~/.aspell.en.pws $FDIR/aspell.en.pws

FDIR="matplotlib"
cp ~/.matplotlib/matplotlibrc $FDIR/matplotlibrc 
