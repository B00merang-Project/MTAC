#!/bin/bash

case $1 in
 plex)
    cat ../widgets/menubar/plex.css >> ../build/gtk-widgets.css
    ;;
 slate)
    cat ../widgets/menubar/slate.css >> ../build/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets/menubar/whistler.css >> ../build/gtk-widgets.css
    ;;
 *)
    cat ../widgets/menubar/normal.css >> ../build/gtk-widgets.css
    ;;
esac
