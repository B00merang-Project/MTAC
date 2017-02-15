#!/bin/bash

echo 'Converting...'

# close focused
cfn='close-focused-normal.png'
# close focused:hover
cfh='close-focused-active.png'
# close focused:active
cfa='close-focused-pressed.png'
# close unfocused
cun='close-unfocused-normal.png'
# close unfocused active
cua='close-unfocused-active.png'

# ---- Minimize ---- #
# minimize focused
mfn='minimize-focused-normal.png'
# minimize focused:hover
mfh='minimize-focused-active.png'
# minimize focused:active
mfa='minimize-focused-pressed.png'
# minimize unfocused
mun='minimize-unfocused-normal.png'
# minimize unfocused active
mua='minimize-unfocused-active.png'

# ---- Maximize ---- #
# maximize focused
mxfn='maximize-focused-normal.png'
# maximize focused:hover
mxfh='maximize-focused-active.png'
# maximize focused:active
mxfa='maximize-focused-pressed.png'
# maximize unfocused
mxun='maximize-unfocused-normal.png'
# maximize unfocused active
mxua='maximize-unfocused-active.png'

# ---- Restore ---- #
# restore focused
rfn='restore-focused-normal.png'
# restore focused:hover
rfh='restore-focused-active.png'
# restore focused:active
rfa='restore-focused-pressed.png'
# restore unfocused
run='restore-unfocused-normal.png'
# restore unfocused active
rua='restore-unfocused-active.png'

# ---- Borders ---- #
bfb="border-focused-bottom.png"
bub="border-unfocused-bottom.png"

bflc="border-focused-leftcorner.png"
bulc="border-unfocused-leftcorner.png"

bfrc="border-focused-rightcorner.png"
burc="border-unfocused-rightcorner.png"

bfl="border-focused-left.png"
bul="border-unfocused-left.png"

bfr="border-focused-right.png"
bur="border-unfocused-right.png"

tfl="titlebar-focused-left.png"
tul="titlebar-unfocused-left.png"

tfm="titlebar-focused-middle.png"
tum="titlebar-unfocused-middle.png"

tfr="titlebar-focused-right.png"
tur="titlebar-unfocused-right.png"

# make buttons

# close
convert $cfn close-active.xpm
convert $cfh close-prelight.xpm
convert $cfa close-pressed.xpm
convert $cun close-inactive.xpm

# minimize
convert $mfn hide-active.xpm
convert $mfh hide-prelight.xpm
convert $mfa hide-pressed.xpm
convert $mun hide-inactive.xpm

# maximize
convert $mxfn maximize-active.xpm
convert $mxfh maximize-prelight.xpm
convert $mxfa maximize-pressed.xpm
convert $mxun maximize-inactive.xpm

# restore (unsupported by xfwm4)
#convert $rfn 
#convert $rfh
#convert $rfa
#convert $rua

# and borders
convert $bfb bottom-active.xpm
convert $bub bottom-inactive.xpm
convert $bflc bottom-left-active.xpm
convert $bulc bottom-left-inactive.xpm
convert $bfrc bottom-right-active.xpm
convert $burc bottom-right-inactive.xpm
convert $bfl left-active.xpm
convert $bul left-inactive.xpm
convert $bfr right-active.xpm
convert $bur right-active.xpm

# and 1 set of titlebar assets
convert $tfl top-left-active.xpm
convert $tul top-left-inactive.xpm
convert $tfr top-right-active.xpm
convert $tur top-right-inactive.xpm
convert $tfm title-1-active.xpm
convert $tum title-1-inactive.xpm

# assuming title-1-active/inactive exist (in XPM format) - previous step
active="title-1-active.xpm"
inactive="title-1-inactive.xpm"

string1="title-"
string2="-active.xpm"
string3="-inactive.xpm"

# for numbered copies

start=2
end=5

for (( count=$start; count<=$end; count++  ))
do
 cp $active "$string1$count$string2"
 cp $inactive "$string1$count$string3"
done

mkdir xfwm4
mv *.xpm xfwm4

cd xfwm4

fga="ffffff"
fgi="f8f8f8"

echo "# Name: $1
# Author: Elbullazul <cmedelahumada@gmail.com>
# License: GPL-3.0+

active_text_color=#$fga
inactive_text_color=#$fgi
title_shadow_active=true
button_offset=1
button_spacing=2
show_app_icon=true
full_width_title=true
maximized_offset=10
title_horizontal_offset=3
title_shadow_active=false
title_shadow_inactive=false
title_vertical_offset_active=0
title_vertical_offset_inactive=0
title_shadow_active=false
title_shadow_inactive=false
shadow_delta_height=0
shadow_delta_width=0
shadow_delta_x=0
shadow_delta_y=0
shadow_opacity=30" >> themerc

echo 'Done'
