#!/bin/sh


selection=$(grep -v '^#' $HOME/01_personal/03_cloud/01_dropbox/20240000_bookmarks | rofi -dmenu -i | cut -d' ' -f1)


xdotool type $selection

