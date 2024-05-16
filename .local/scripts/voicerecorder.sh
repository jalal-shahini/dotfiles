#!/bin/sh

cd /home/omid/Documents/Personal/Library/Lectures/Philosophize_This/Philosophize_This/

for file in *.mp3
do
    cp "${file}" /mnt/Voice-Recorder/MUSIC/Philosophize_This/
    echo "${file} is copied."
done

