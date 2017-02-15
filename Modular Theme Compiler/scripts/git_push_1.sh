#!/bin/bash

declare -a flags # Declare a new array
#flags[0]='XP themes'
flags[1]='Windows 10 Dark'
flags[2]='Windows 10 Metro'
flags[3]='Windows 10 Light'
#flags[4]='W3'

# We used getopts to manage flags, but DE override says no
for f in "${!flags[@]}" 
do
 echo "Commiting to ${flags[$f]}"
 cd "${flags[$f]}"
 git add --all
 git commit -m "$1"
 git push
 cd ..
done
