#!/bin/sh

DIR=$"/home/omid/Documents/Personal/Library/Leitner_Box/data"

[ ! -e "$DIR/box1.jst" ]; touch "$DIR/box1.jst"
[ ! -e "$DIR/box2.jst" ]; touch "$DIR/box2.jst"
[ ! -e "$DIR/box3.jst" ]; touch "$DIR/box3.jst"
[ ! -e "$DIR/box4.jst" ]; touch "$DIR/box4.jst"
[ ! -e "$DIR/box5.jst" ]; touch "$DIR/box5.jst"
[ ! -e "$DIR/box6.jst" ]; touch "$DIR/box6.jst"

INPUT=$(zenity --forms --title="Add word" --text="Add a new word to your Leitner box!" --add-entry="Word" --add-entry="Description")

DATE_ADDED=$(date "+%Y%m%d")



if [ -z "$INPUT" ] || [ "$INPUT" == "|" ]
then
    exit
else
echo $INPUT"|"$DATE_ADDED >> "$DIR/box1.jst"
fi
