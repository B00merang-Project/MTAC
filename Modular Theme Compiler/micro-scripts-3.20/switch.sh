#!/bin/bash

case $1 in
 luna|slate|olive)
    cat ../widgets-3.20/switch/luna.css >> ../build-3.20/gtk-widgets.css
    ;;
 metal)
    cat ../widgets-3.20/switch/metal.css >> ../build-3.20/gtk-widgets.css
    ;;
 embedded|zune)
    cat ../widgets-3.20/switch/glass.css>> ../build-3.20/gtk-widgets.css
    ;;
 royale|royale-dark)
    cat ../widgets-3.20/switch/royale.css>> ../build-3.20/gtk-widgets.css
    ;;
 plex)
    cat ../widgets-3.20/switch/plex.css>> ../build-3.20/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets-3.20/switch/whistler.css>> ../build-3.20/gtk-widgets.css
    ;;
esac
