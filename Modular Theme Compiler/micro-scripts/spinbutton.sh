#!/bin/bash

case $1 in
 plex)
    cat ../widgets/spinbutton/plex.css >> ../build/gtk-widgets.css
    ;;
 *)
    cat ../widgets/spinbutton/normal.css >> ../build/gtk-widgets.css
    ;;
esac
