#!/bin/bash

case $1 in
 luna|olive|metal|slate)
    cat ../widgets/notebook/normal.css >> ../build/gtk-widgets.css
    ;;
 embedded|zune)
    cat ../widgets/notebook/glass.css>> ../build/gtk-widgets.css
    ;;
 royale|royale-dark)
    cat ../widgets/notebook/royale.css>> ../build/gtk-widgets.css
    ;;
 plex)
    cat ../widgets/notebook/plex.css>> ../build/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets/notebook/whistler.css>> ../build/gtk-widgets.css
    ;;
esac
