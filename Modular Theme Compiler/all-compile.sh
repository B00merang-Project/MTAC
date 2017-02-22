#!/bin/bash

# clean directory
rm -rf release/*
rm -rf build/*
rm -rf build-3.20/*

echo 'Compile all themes...'

echo -n 'Luna...'
. compile.sh luna
echo -n 'Metal...'
. compile.sh metal
echo -n 'Olive...'
. compile.sh olive
echo -n 'Plex...'
. compile.sh plex
echo -n 'Slate...'
. compile.sh slate
echo -n 'Embedded...'
. compile.sh embedded
echo -n 'Zune...'
. compile.sh zune
echo -n 'Royale...'
. compile.sh royale
echo -n 'Royale Dark...'
. compile.sh royale-dark
echo -n 'Whistler...'
. compile.sh whistler

echo 'Done compiling'
