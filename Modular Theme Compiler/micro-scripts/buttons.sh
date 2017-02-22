#!/bin/bash

case $1 in
 luna|slate)
    cat ../widgets/button/luna.css >> ../build/gtk-widgets.css
    ;;
 olive)
    cat ../widgets/button/olive.css >> ../build/gtk-widgets.css
    ;;
 metal)
    cat ../widgets/button/metal.css >> ../build/gtk-widgets.css
    ;;
 embedded|zune)
    cat ../widgets/button/glass.css>> ../build/gtk-widgets.css
    ;;
 royale|royale-dark)
    cat ../widgets/button/royale.css>> ../build/gtk-widgets.css
    ;;
 plex)
    cat ../widgets/button/plex.css>> ../build/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets/button/whistler.css>> ../build/gtk-widgets.css
    ;;
esac
