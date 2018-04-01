#!/bin/bash

FDIR="bash"
cp ~/.bashrc $FDIR/bashrc
cp ~/.bash_profile $FDIR/bash_profile

FDIR="spell"
cp ~/.aspell.en.prepl $FDIR/aspell.en.prepl
cp ~/.aspell.en.pws $FDIR/aspell.en.pws

FDIR="atom"
cp ~/.atom/config.cson $FDIR/.
cp ~/.atom/github.cson $FDIR/.
cp ~/.atom/kite-config.json $FDIR/.
cp ~/.atom/snippets.cson $FDIR/.
cp ~/.atom/init.coffee $FDIR/.
cp ~/.atom/keymap.cson $FDIR/.
cp ~/.atom/packages.list $FDIR/.
cp ~/.atom/styles.less $FDIR/.
apm list --installed --bare > $FDIR/packages.list

FDIR="matplotlib"
cp ~/.matplotlib/matplotlibrc $FDIR/matplotlibrc
