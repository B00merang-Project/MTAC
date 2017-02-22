#!/bin/bash

case $1 in
 plex)
    cat ../widgets/combo/plex.css>> ../build/gtk-widgets.css
    ;;
 *)
    cat ../widgets/combo/normal.css>> ../build/gtk-widgets.css
    ;;
esac
