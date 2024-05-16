#!/bin/bash

STATUS=$(nmcli device status | grep "^wlan0" | awk '{print $3}')

if [[ $STATUS = "disconnected" ]]; then
    nmcli device wifi connect FRITZ\!Box\ 7560\ EJ
    echo "wifi connected!"
    notify-send "🕸️" "wifi connected"
elif [[ $STATUS = "connected" ]]; then
    nmcli device disconnect wlp58s0
    echo "wifi disconnected"
    notify-send "🕸️" "wifi disonnected"
else
    echo "error"
fi

