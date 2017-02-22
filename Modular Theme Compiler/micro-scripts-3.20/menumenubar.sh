#!/bin/bash

case $1 in
 luna|olive|metal|slate)
    cat ../widgets-3.20/menumenubar/no-asset.css >> ../build-3.20/gtk-widgets.css
    ;;
 embedded|royale|royale-dark|zune)
    cat ../widgets-3.20/menumenubar/asset.css >> ../build-3.20/gtk-widgets.css
    ;;
 plex)
    cat ../widgets-3.20/menumenubar/plex.css >> ../build-3.20/gtk-widgets.css
    ;;
 slate)
    cat ../widgets-3.20/menumenubar/slate.css >> ../build-3.20/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets-3.20/menumenubar/whistler.css >> ../build-3.20/gtk-widgets.css
    ;;
esac
