#!/bin/bash

# To set this in motion we need to make this executable &
# $ crontab -e
# $ 0 0 * * 0 cd /Users/mdekauwe/dot_files && ./git_run.sh
# to back this up every week 


./get_files.sh

git add .
curtime=`date`
git commit -m "Automatic Backup @ $curtime"
git push origin master
