#!/bin/bash

A=$(sed -n  "H;1h;\${g;s/\n//g;p}" $BIB | sed 's/@/\n@/g'| sed 's/@[a-zA-Z1-9]*{/{/g'| sed 's/[a-zA-Z ]*=//g' | sed 's/\s*{/{/g' | sed 's/[{}]//g' | sed 's/,,/,/g' | sed 's/,/ /g' | wofi -d) >> /dev/null

chosen=$(echo $A | awk '{ print $1 }')


# Exit if none chosen.
[ -z "$chosen" ] && exit


printf "$chosen" | xclip -selection clipboard
notify-send "Bib key '$chosen' copied to clipboard." &
