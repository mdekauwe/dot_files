#!/bin/bash

FDIR="bash"
cp $FDIR/bashrc ~/.bashrc
cp $FDIR/bash_profile ~/.bash_profile

FDIR="spell"
cp $FDIR/aspell.en.prepl ~/.aspell.en.prepl
cp $FDIR/aspell.en.pws ~/.aspell.en.pws

FDIR="atom"
cp $FDIR/config.cson ~/.atom/
cp $FDIR/github.cson ~/.atom/
cp $FDIR/kite-config.json ~/.atom/
cp $FDIR/snippets.cson ~/.atom/
cp $FDIR/init.coffee ~/.atom/
cp $FDIR/keymap.cson ~/.atom/
cp $FDIR/packages.list ~/.atom/
cp $FDIR/styles.less ~/.atom/

FDIR="matplotlib"
if [ ! -d ".$FDIR" ]
then
    mkdir -p ~/.matplotlib
fi
cp $FDIR/matplotlibrc ~/.matplotlib/matplotlibrc

# Set up sybmolic links
USER=$(whoami)
D=journals
if [ ! -d "$D" ]
then
    ln -s /Users/$USER/Dropbox/journals journals
fi
