#!/bin/bash

t=$(date "+%Y-%m-%d|%H:%M")

cd $HOME/Videos/Screencasts

sleep 2

ffmpeg -f x11grab -s 1920x1080 -i :0.0 -f alsa -i default $t.mkv
