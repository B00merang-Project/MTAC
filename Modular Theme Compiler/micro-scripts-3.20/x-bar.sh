#!/bin/bash

case $1 in
 luna)
    cat ../widgets-3.20/x-bar/luna.css >> ../build-3.20/gtk-widgets.css
    ;;
 olive)
    cat ../widgets-3.20/x-bar/olive.css >> ../build-3.20/gtk-widgets.css
    ;;
 metal)
    cat ../widgets-3.20/x-bar/metal.css >> ../build-3.20/gtk-widgets.css
    ;;
 embedded|zune)
    cat ../widgets-3.20/x-bar/glass.css >> ../build-3.20/gtk-widgets.css
    ;;
 royale|royale-dark)
    cat ../widgets-3.20/x-bar/royale.css >> ../build-3.20/gtk-widgets.css
    ;;
 plex)
    cat ../widgets-3.20/x-bar/plex.css >> ../build-3.20/gtk-widgets.css
    ;;
 slate)
    cat ../widgets-3.20/x-bar/slate.css >> ../build-3.20/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets-3.20/x-bar/whistler.css >> ../build-3.20/gtk-widgets.css
    ;;
esac
