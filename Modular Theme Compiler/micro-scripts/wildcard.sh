#!/bin/bash

case $1 in
 plex)
    cat ../widgets/wildcard/plex.css >> ../build/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets/wildcard/whistler.css >> ../build/gtk-widgets.css
    ;;
 *)
    cat ../widgets/wildcard/normal.css >> ../build/gtk-widgets.css
    ;;
esac
