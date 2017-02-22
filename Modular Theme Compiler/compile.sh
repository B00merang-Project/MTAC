#!/bin/bash

theme='luna'

# get flags
  declare -a flags # Declare a new array
  flags=("$@")     # Host all flags in the array

# We used getopts to manage flags, but DE override says no
  for f in ${!flags[@]}
  do
    case ${flags[$f]} in

    --clean)
     rm -rf build/*
     rm -rf build-3.20/*
     rm -rf release/*
    ;;

    luna|embedded|royale|royale-dark|zune|plex|slate|metal|olive|whistler)
     theme="${flags[$f]}"
    ;;

    --purge-env)
     echo 'cleaning directories...'
     rm -rf build/*
     rm -rf build-3.20/*
     rm -rf release/*
     rm -rf zipack/*
     echo 'Done'
     exit
    ;;

    *)
    ;;
    esac
  done

# run functions
make_env() {
 cd colors
 cp "$theme.css" ../build/gtk.css
 cd ../build
# touch gtk-widgets.css
 cd ..

 cd colors-3.20
 cp "$theme.css" ../build-3.20/gtk.css
 cd ../build-3.20
# touch gtk-widgets.css
 cd ..
}

make_index() {
 echo "[Desktop Entry]
Type=X-GNOME-Metatheme
Name=$1
Comment=Windows XP themes for Linux OSes
Comment=Author : Christian Medel (Elbullazul)
Version=rolling
Encoding=UTF-8

[X-GNOME-Metatheme]
GtkTheme=$1
MetacityTheme=$1
ButtonLayout=:minimize,maximize,close" >> "$2"
}

package_up() {

# capital first letter
 name="$(tr '[:lower:]' '[:upper:]' <<< ${theme:0:1})${theme:1}"

# adjust name if theme is royale dark
 if [[ "$name" == 'Royale-dark' ]]; then
  name="Royale Dark"
 fi

 fullname="Windows XP $name"

 case $fullname in
  "Windows XP Plex")
    fullname="Windows Longhorn Plex"
  ;;
  "Windows XP Slate")
    fullname="Windows Longhorn Slate"
  ;;
  "Windows XP Olive")
    fullname="Windows XP Homestead"
  ;;
  "Windows XP Metal")
    fullname="Windows XP Metallic"
  ;;
  "Windows XP Whistler")
    fullname="Windows Whistler"
  ;;
 esac

 mkdir "$fullname"
 cp -a "files/cinnamon/$theme" "$fullname/cinnamon"
 cp -a "files/gtk2/$theme" "$fullname/gtk-2.0"
 cp -a "files/metacity/$theme" "$fullname/metacity-1"
 cp -a "files/unity/$theme" "$fullname/unity"

 # if file exits copy xfwm theme
 if [ -d "files/xfce/$theme" ]; then
  cp -a  "files/xfce/$theme" "$fullname/xfwm4"
 fi

 ln -s ../gtk-3.20 build/gtk-3.20
 cp -a "build" "$fullname/gtk-3.0"
 cp -a "build-3.20" "$fullname/gtk-3.20"
 rm -rf build/*
 rm -rf build-3.20/*
 make_index "$fullname" "$fullname/index.theme"
 mv "$fullname" release
 cd release
 zip -r "$fullname.zip" "$fullname" > /dev/null 2>&1
 mv *.zip ../zipack
 cd ..
}

conditions() {
 # select case & make operations

 case $1 in
  1)
    . ../micro-scripts/wildcard.sh $theme
    ;;
  2)
    . ../micro-scripts/buttons.sh $theme
    ;;
  3)
    . ../micro-scripts/combo.sh $theme
    ;;
  4)
    . ../micro-scripts/menu.sh $theme
    ;;
  5)
    . ../micro-scripts/menubar.sh $theme
    ;;
  6)
    . ../micro-scripts/notebook.sh $theme
    ;;
  7)
    . ../micro-scripts/scrollprogress.sh $theme
    ;;
  8)
    . ../micro-scripts/headerbarseparator.sh $theme
    ;;
  9)
    . ../micro-scripts/spinbutton.sh $theme
    ;;
  10)
    . ../micro-scripts/switch.sh $theme
    ;;
  11)
    . ../micro-scripts/x-bar.sh $theme
    ;;
  12)
    . ../micro-scripts/titlebar.sh $theme
    ;;
  *)
    ;;
 esac

}

conditions_320() {
 # select case & make operations

 case $1 in
  1)
    . ../micro-scripts-3.20/wildcard.sh $theme
    ;;
  2)
    . ../micro-scripts-3.20/buttons.sh $theme
    ;;
  3)
    . ../micro-scripts-3.20/combo.sh $theme
    ;;
  4)
    . ../micro-scripts-3.20/menumenubar.sh $theme
    ;;
  5)
    . ../micro-scripts-3.20/notebook.sh $theme
    ;;
  6)
    . ../micro-scripts-3.20/scrollprogress.sh $theme
    ;;
  7)
    . ../micro-scripts-3.20/headerbarseparator.sh $theme
    ;;
  8)
    . ../micro-scripts-3.20/spinbutton.sh $theme
    ;;
  9)
    . ../micro-scripts-3.20/switch.sh $theme
    ;;
  10)
    . ../micro-scripts-3.20/x-bar.sh $theme
    ;;
  11)
    . ../micro-scripts-3.20/titlebar.sh $theme
    ;;
  *)
    ;;
 esac

}

get_code() {
 cd common
 start=1
 end=13
 for (( c=$start; c<=$end; c++  ))
 do
  cat "s$c.css" >> ../build/gtk-widgets.css

  # Inject code here, depending on stuff
  conditions $c
  # depending on number, we'll use different stuff
 done
 cd ..

 get_code_320
}

get_code_320() {
 cd common-3.20
 start=1
 end=12
 for (( c=$start; c<=$end; c++  ))
 do
  cat "s$c.css" >> ../build-3.20/gtk-widgets.css

  # Inject code here, depending on stuff
  conditions_320 $c
  # depending on number, we'll use different stuff
 done
 cd ..
}

get_assets() {
# copy assets
 cp -R assets/$theme/. 'build/'
 cp -R assets-3.20/$theme/. 'build-3.20/'

 case $theme in
  plex)
    cp common/assets-plex.css build/gtk-widgets-assets.css
    cp -a common/apps-all build/apps
    cp -a common/apps-plex/* build/apps

# 3.20
    cp common-3.20/assets-plex.css build-3.20/gtk-widgets-assets.css
    cp -a common-3.20/apps-all build-3.20/apps
    ;;
  slate)
    cp common/assets-slate.css build/gtk-widgets-assets.css
    cp -a common/apps-all build/apps
    cp -a common/apps-slate/* build/apps
# 3.20
    cp common-3.20/assets-slate.css build-3.20/gtk-widgets-assets.css
    cp -a common-3.20/apps-all build-3.20/apps
    ;;
  whistler)
    cp common/assets-whistler.css build/gtk-widgets-assets.css
    cp -a common/apps-all build/apps
    cp -a common/apps-whistler/* build/apps
# 3.20
    cp common-3.20/assets-whistler.css build-3.20/gtk-widgets-assets.css
    cp -a common-3.20/apps-all build-3.20/apps
    cp -a common-3.20/apps-whistler/* build-3.20/apps
    ;;
  *)
    cp common/assets-all.css build/gtk-widgets-assets.css
    cp -a common/apps-all build/apps

# 3.20
    cp common-3.20/assets-all.css build-3.20/gtk-widgets-assets.css
    cp -a common-3.20/apps-all build-3.20/apps
    ;;
 esac

 # get settings.ini
 cp common/settings.ini build
 cp common-3.20/settings.ini build-3.20

}

put_thumbs() {
 cd thumbnails
 
 case $theme in
  luna|olive|slate)
   cp "normal.png" ../build/thumbnail.png
   cp "normal.png" ../build-3.20/thumbnail.png
  ;;
  *)
   cp "$theme.png" ../build/thumbnail.png
   cp "$theme.png" ../build-3.20/thumbnail.png
  ;;
 esac

 cd ..
}

make_env
get_code
get_assets
put_thumbs
package_up

echo "Done."
