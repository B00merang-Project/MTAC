#!/bin/bash

case $1 in
 luna|olive|metal|slate)
    cat ../widgets/menu/no-asset.css >> ../build/gtk-widgets.css
    ;;
 embedded|royale|royale-dark|zune)
    cat ../widgets/menu/asset.css >> ../build/gtk-widgets.css
    ;;
 plex)
    cat ../widgets/menu/plex.css >> ../build/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets/menu/whistler.css >> ../build/gtk-widgets.css
    ;;
esac
