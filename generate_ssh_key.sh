#!/bin/bash

# One time git config
git config --global user.name "mdekauwe"
git config --global user.email "mdekauwe@gmail.com"
git config --global core.editor "atom --wait"

# SSH stuff
ssh-keygen -t rsa -C "mdekauwe@gmail.com"
ssh-copy-id mdekauwe@gmail.com
