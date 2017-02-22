#!/bin/bash

case $1 in
 plex)
    cat ../widgets-3.20/wildcard/plex.css >> ../build-3.20/gtk-widgets.css
    ;;
 whistler)
    cat ../widgets-3.20/wildcard/whistler.css >> ../build-3.20/gtk-widgets.css
    ;;
 *)
    cat ../widgets-3.20/wildcard/normal.css >> ../build-3.20/gtk-widgets.css
    ;;
esac
