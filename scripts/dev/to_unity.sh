#!/bin/bash

# Conversion script for XP themes to an Unity compatible structure
# Extension of the Modular Theme Architecture and Compiler
# B00merang Project (GPL v3) 2017
# Author: Christian Medel (Elbullazul)

# Check if theme is compatible
comp="$(cat ../resources/compat/unity | grep $1)"

if [ "$comp" != "$1" ]; then
 echo 'Not found'
 exit
fi

# make environment
cp -a "../extras/metacity/$1" ../extras/unity
cd ../extras/unity

cd "$1"

# ---- Close ---- #
cfn='close-focused-normal.png'
cfh='close-focused-active.png'
cfa='close-focused-pressed.png'
cun='close-unfocused-normal.png'
cua='close-unfocused-active.png'

# ---- Minimize ---- #
mfn='minimize-focused-normal.png'
mfh='minimize-focused-active.png'
mfa='minimize-focused-pressed.png'
mun='minimize-unfocused-normal.png'
mua='minimize-unfocused-active.png'

# ---- Maximize ---- #
mxfn='maximize-focused-normal.png'
mxfh='maximize-focused-active.png'
mxfa='maximize-focused-pressed.png'
mxun='maximize-unfocused-normal.png'
mxua='maximize-unfocused-active.png'

# ---- Restore ---- #
rfn='restore-focused-normal.png'
rfh='restore-focused-active.png'
rfa='restore-focused-pressed.png'
run='restore-unfocused-normal.png'
rua='restore-unfocused-active.png'

# ---- Execution ---- #
mkdir unity

# copy & rename files (close)
cp $cfn unity/close.png
cp $cfn unity/close_focused_normal.png
cp $cfh unity/close_focused_prelight.png
cp $cfa unity/close_focused_pressed.png
cp $cun unity/close_unfocused.png
cp $cua unity/close_unfocused_prelight.png
cp $cfa unity/close_unfocused_pressed.png

# copy & rename files (maximize)
cp $mxfn unity/maximize.png
cp $mxfn unity/maximize_focused_normal.png
cp $mxfh unity/maximize_focused_prelight.png
cp $mxfa unity/maximize_focused_pressed.png
cp $mxun unity/maximize_unfocused.png
cp $mxua unity/maximize_unfocused_prelight.png
cp $mxfa unity/maximize_unfocused_pressed.png

# copy & rename files (minimize)
cp $mfn unity/minimize.png
cp $mfn unity/minimize_focused_normal.png
cp $mfh unity/minimize_focused_prelight.png
cp $mfa unity/minimize_focused_pressed.png
cp $mun unity/minimize_unfocused.png
cp $mua unity/minimize_unfocused_prelight.png
cp $mfa unity/minimize_unfocused_pressed.png

# copy & rename files (restore)
cp $rfn unity/unmaximize.png
cp $rfn unity/unmaximize_focused_normal.png
cp $rfh unity/unmaximize_focused_prelight.png
cp $rfa unity/unmaximize_focused_pressed.png
cp $run unity/unmaximize_unfocused.png
cp $rua unity/unmaximize_unfocused_prelight.png
cp $rfa unity/unmaximize_unfocused_pressed.png

# post-processing
cp -R unity ..
cd ..
rm -r "$1"
mv unity "$1"
