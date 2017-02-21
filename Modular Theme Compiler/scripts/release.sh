#!/bin/bash

theme=$1

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
  "Windows XP 8")
    fullname="Windows 8.1"
  ;;
  "Windows XP Vista")
    fullname="Windows Vista"
  ;;
 esac

 cd ..

 mkdir "release/$fullname"
 cp -a "extras/cinnamon/$theme" "release/$fullname/cinnamon"
 cp -a "extras/gtk2/$theme" "release/$fullname/gtk-2.0"
 cp -a "extras/metacity/$theme" "release/$fullname/metacity-1"
 cp -a "extras/unity/$theme" "release/$fullname/unity"

 # if file exits copy xfwm theme
 if [ -d "extras/xfce/$theme" ]; then
  cp -a  "extras/xfce/$theme" "release/$fullname/xfwm4"
 fi

 cp -a "compiler/Debug/3.0" "release/$fullname/gtk-3.0"
 cp -a "compiler/Debug/3.20" "release/$fullname/gtk-3.20"

 cd "release/$fullname/gtk-3.0"
 ln -s ../gtk-3.20 gtk-3.20
 cd ../../..

 make_index "$fullname" "release/$fullname/index.theme"
# zip -r "release/$fullname.zip" "release/$fullname" > /dev/null 2>&1
# mv release/*.zip release/ZIP

 cd compiler

}

package_up
