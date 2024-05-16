#!/bin/sh


A=$(ls $HOME/.local/share/mail/jalal@jalalshahini.com/INBOX/new | wc -l) 
B=$(ls $HOME/.local/share/mail/jst@jalalshahini.com/INBOX/new | wc -l)
OUTPUT=$(($A+$B))

if [[ $OUTPUT == 0 ]]
then
    echo "📪 0"
else
    echo "📫 $OUTPUT"
fi

if [[ $1 == "-f" ]]; then
    notify-send -t 5000 "📧" "Jalal@jalalshahini.com\t\t $A\nJst@jalalshahini.com\t\t $B"
fi
