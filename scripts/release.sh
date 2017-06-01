#!/bin/bash

theme=$1
gtk=$2

make_index() {
 echo "[Desktop Entry]
Type=X-GNOME-Metatheme
Name=$1
Comment=$1 theme for Linux OSes; based on the MTAC architecture
Comment=Author : Christian Medel (Elbullazul)
Version=rolling
Encoding=UTF-8

[X-GNOME-Metatheme]
GtkTheme=$1
MetacityTheme=$1
ButtonLayout=:minimize,maximize,close" >> "$2"
}

if_copy() {

 if [ -d "$1" ]; then
  cp -a  "$1" "$2"
 fi

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
  "Windows XP Aero")
    fullname="Windows Longhorn Aero"
  ;;
  "Windows XP Glass")
    fullname="B00merang Glass"
  ;;
  "Windows XP Green")
    fullname="B00merang Green"
  ;;
  "Windows XP Dark")
    fullname="B00merang Dark"
  ;;
  "Windows XP Unity8")
    fullname="Unity8"
  ;;
 esac

 cd ..

 mkdir "release/$fullname"

 if_copy "extras/cinnamon/$theme" "release/$fullname/cinnamon"
 if_copy "extras/gtk2/$theme" "release/$fullname/gtk-2.0"
 if_copy "extras/metacity/$theme" "release/$fullname/metacity-1"
 if_copy "extras/unity/$theme" "release/$fullname/unity"
 if_copy "extras/xfce/$theme" "release/$fullname/xfwm4"

 cp -a "compiler/Debug/3.0" "release/$fullname/gtk-3.0"

 if [ "$1" == "3.20" ]; then
  cp -a "compiler/Debug/3.20" "release/$fullname/gtk-3.20"

  cd "release/$fullname/gtk-3.0"
  ln -s ../gtk-3.20 gtk-3.20
  cd ../../..
 fi

 make_index "$fullname" "release/$fullname/index.theme"
# zip -r "release/$fullname.zip" "release/$fullname" > /dev/null 2>&1
# mv release/*.zip release/ZIP

 cd compiler

}

package_up $gtk
