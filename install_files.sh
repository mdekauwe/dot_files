#!/bin/bash

FDIR="bash"
cp $FDIR/bashrc ~/.bashrc
cp $FDIR/bash_profile ~/.bash_profile

FDIR="spell"
cp $FDIR/aspell.en.prepl ~/.aspell.en.prepl
cp $FDIR/aspell.en.pws ~/.aspell.en.pws

FDIR="atom"
if [ ! -d ".$FDIR" ]
then
    mkdir -p ~/.atom
fi
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

# http://gree2.github.io/python/2015/04/27/python-change-matplotlib-font-on-mac
#mkdir ~/Desktop/font_copies
#cp /System/Library/Fonts/Helvetica.dfont ~/Desktop/font_copies
#cd Desktop/font_copies/
#fondu -show ~/Desktop/font_copies/Helvetica.dfont

#cd /opt/local/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/matplotlib/mpl-data/fonts/ttf
#cp ~/Desktop/font_copies .
#rm ~/.matplotlibrc/fontList.py3k.cache


# Set up sybmolic links
USER=$(whoami)
D=journals
if [ ! -d "$D" ]
then
    ln -s /Users/$USER/Dropbox/journals journals
fi
