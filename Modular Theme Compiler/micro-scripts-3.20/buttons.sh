#!/bin/bash

case $1 in
 luna|slate)
    cat ../widgets-3.20/button/luna.css >> ../build-3.20/gtk-widgets.css
    ;;
 olive)
    cat ../widgets-3.20/button/olive.css >> ../build-3.20/gtk-widgets.css
    ;;
 metal)
    cat ../widgets-3.20/button/metal.css >> ../build-3.20/gtk-widgets.css
    ;;
 embedded|zune)
    cat ../widgets-3.20/button/glass.css>> ../build-3.20/gtk-widgets.css
    ;;
 royale|royale-dark)
    cat ../widgets-3.20/button/royale.css>> ../build-3.20/gtk-widgets.css
    ;;
 plex)
    cat ../widgets-3.20/button/plex.css>> ../build-3.20/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets-3.20/button/whistler.css>> ../build-3.20/gtk-widgets.css
    ;;
esac
