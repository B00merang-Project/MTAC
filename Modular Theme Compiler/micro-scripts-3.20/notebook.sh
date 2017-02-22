#!/bin/bash

case $1 in
 luna|olive|metal|slate)
    cat ../widgets-3.20/notebook/normal.css >> ../build-3.20/gtk-widgets.css
    ;;
 embedded|zune)
    cat ../widgets-3.20/notebook/glass.css>> ../build-3.20/gtk-widgets.css
    ;;
 royale|royale-dark)
    cat ../widgets-3.20/notebook/royale.css>> ../build-3.20/gtk-widgets.css
    ;;
 plex)
    cat ../widgets-3.20/notebook/plex.css>> ../build-3.20/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets-3.20/notebook/whistler.css>> ../build-3.20/gtk-widgets.css
    ;;
esac
