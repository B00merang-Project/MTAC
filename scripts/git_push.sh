#!/bin/bash

# script to copy files, add & commit, then self-push to github
# (helper must be on)

cd ../release

# check if folders ecist
# [ "$(ls -A .)" ] && echo empty=0 || empty=1

# if [ $empty -eq 1 ]; then
#  echo "No release found. Re-compile and try again"
#  exit
# fi

for D in *; do
 if [ "$D" != "ZIP" ]; then
  case $D in
   *XP*)
    cp -aR "$D" "../scripts/Github/XP themes"
   ;;
   *Longhorn*)
    cp -aR "$D" "../scripts/Github/Longhorn Project"
   ;;
   *Whistler*)
    cp -aR "$D/." "../scripts/Github/W3"
   ;;
   *8*|*Vista*)
    cp -aR "$D" "../scripts/Github/Redmond Themes Repository"
   ;;
   *B00merang*)
    cp -aR "$D" "../scripts/Github/B00merang Repository"
   ;;
  esac
 fi
done

# commit and leave (in folder Github, you must have extra scripts to push
# and commit automatically

cd ../scripts/Github

# run automated github commits
./win-push.sh

# success message
echo "Releases compressed and pushed to Github"

