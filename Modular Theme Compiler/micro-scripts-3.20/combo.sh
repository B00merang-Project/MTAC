#!/bin/bash

case $1 in
 plex)
    cat ../widgets-3.20/combo/plex.css>> ../build-3.20/gtk-widgets.css
    ;;
 *)
    cat ../widgets-3.20/combo/normal.css>> ../build-3.20/gtk-widgets.css
    ;;
esac
