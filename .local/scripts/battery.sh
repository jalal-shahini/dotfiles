#!/bin/bash

case $BLOCK_BUTTON in
  1) pgrep -x dunst >/dev/null && notify-send "
     : TLP or Unknown
     : Discharging
     : Charging
     : Fully Charged
     : Not Charging
     : LOW"

esac

capacity=$(cat /sys/class/power_supply/"$1"/capacity) || exit
stat=$(cat /sys/class/power_supply/"$1"/status)


if [ "$capacity" -ge 85 ]; then
  dis=" "
elif [ "$capacity" -ge 65 ]; then
  dis=" "
elif [ "$capacity" -ge 50 ]; then
  dis=" "
elif [ "$capacity" -ge 25 ]; then
  dis=" "
else
  dis=" "
  warn=" "
fi

[ -z $warn ] && warn=""

[ "$stat" = "Charging" ] && [ ! -z "$warn" ] && stat="Charging" && warn=""
[ "$stat" = "Discharging" ] && [ ! -z "$warn" ] && stat=""

printf $(echo "$stat" | sed -e \
  "s/,//;s/Discharging/$dis/ \
  ;s/Not charging/  / \
  ;s/Charging/ / \
  ;s/Unknown/ / \
  ;s/Full/ / \
  ;s/ 0*/ /g;s/ :/ /g") "$warn"

echo " $capacity%"
