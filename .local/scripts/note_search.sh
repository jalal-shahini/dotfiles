#!/bin/sh

SEARCH=$(zenity --entry --width 500 --title "Notes" --text "What are you looking for?");

if [ -z "$SEARCH" ]
then
    exit
else

    cd $HOME/Documents/Personal/Notes/Archive/;
    SELECTION=$(grep -il $SEARCH * | rofi -i -dmenu);
    cd $HOME/Documents/Personal/Notes/Archive_HTML/;
    [ -z "$SELECTION" ] || qutebrowser $HOME/Documents/Personal/Notes/Archive_HTML/${SELECTION%.md}.html &
    [ -z "$SELECTION" ] || notify-send -t 2500 "Notes" "The note \"${SELECTION%.md}\" is opened."

fi
