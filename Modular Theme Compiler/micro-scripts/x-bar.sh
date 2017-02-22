#!/bin/bash

case $1 in
 luna)
    cat ../widgets/x-bar/luna.css >> ../build/gtk-widgets.css
    ;;
 olive)
    cat ../widgets/x-bar/olive.css >> ../build/gtk-widgets.css
    ;;
 metal)
    cat ../widgets/x-bar/metal.css >> ../build/gtk-widgets.css
    ;;
 embedded|zune)
    cat ../widgets/x-bar/glass.css >> ../build/gtk-widgets.css
    ;;
 royale|royale-dark)
    cat ../widgets/x-bar/royale.css >> ../build/gtk-widgets.css
    ;;
 plex)
    cat ../widgets/x-bar/plex.css >> ../build/gtk-widgets.css
    ;;
 slate)
    cat ../widgets/x-bar/slate.css >> ../build/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets/x-bar/whistler.css >> ../build/gtk-widgets.css
    ;;
esac
