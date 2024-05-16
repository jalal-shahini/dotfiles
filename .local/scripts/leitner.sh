#!/bin/sh


INPUT=$(zenity --info --width=500 --icon-name="question" --title="Leitner Box" \
      --text "What do you want to do?" \
      --ok-label "Quit" \
      --extra-button "Add" \
      --extra-button "Review")

if [ $? == 0 ]; then
    exit
fi


if [ $INPUT == "Add" ]; then
    ./.scripts/leitner_add.sh
    exit
elif [ $INPUT == "Review" ]; then
    ./.scripts/leitner_review.sh
    exit
fi
