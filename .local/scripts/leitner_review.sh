#!/bin/sh

LASTRUN_FILE=$"/home/omid/.cache/Leitner/.lastrun"

[ ! -e $LASTRUN_FILE ]; touch $LASTRUN_FILE

LASTRUN=$(head -n 1 $LASTRUN_FILE)
DATE=$(date "+%Y%m%d")
DATE_1=$(date --date="1 day ago" "+%Y%m%d")
DATE_2=$(date --date="4 day ago" "+%Y%m%d")
DATE_3=$(date --date="8 day ago" "+%Y%m%d")
DATE_4=$(date --date="15 day ago" "+%Y%m%d")
DATE_5=$(date --date="30 day ago" "+%Y%m%d")



if [ $LASTRUN == $DATE_1 ]
then


[ ! -e /home/omid/.cache/Leitner/.temp{$DATE} ]; touch /home/omid/.cache/Leitner/.temp

grep -i $DATE_1 /home/omid/Documents/Personal/Library/Leitner_Box/data/words.jst >> /home/omid/.cache/Leitner/.temp
grep -i $DATE_2 /home/omid/Documents/Personal/Library/Leitner_Box/data/words.jst >> /home/omid/.cache/Leitner/.temp
grep -i $DATE_3 /home/omid/Documents/Personal/Library/Leitner_Box/data/words.jst >> /home/omid/.cache/Leitner/.temp
grep -i $DATE_4 /home/omid/Documents/Personal/Library/Leitner_Box/data/words.jst >> /home/omid/.cache/Leitner/.temp
grep -i $DATE_5 /home/omid/Documents/Personal/Library/Leitner_Box/data/words.jst >> /home/omid/.cache/Leitner/.temp

echo $DATE_1
echo $DATE_2
echo $DATE_3
echo $DATE_4
echo $DATE_5

fi


echo $DATE > /home/omid/.cache/Leitner/.lastrun
