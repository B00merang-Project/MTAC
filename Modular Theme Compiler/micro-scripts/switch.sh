#!/bin/bash

case $1 in
 luna|slate|olive)
    cat ../widgets/switch/luna.css >> ../build/gtk-widgets.css
    ;;
 metal)
    cat ../widgets/switch/metal.css >> ../build/gtk-widgets.css
    ;;
 embedded|zune)
    cat ../widgets/switch/glass.css>> ../build/gtk-widgets.css
    ;;
 royale|royale-dark)
    cat ../widgets/switch/royale.css>> ../build/gtk-widgets.css
    ;;
 plex)
    cat ../widgets/switch/plex.css>> ../build/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets/switch/whistler.css>> ../build/gtk-widgets.css
    ;;
esac
