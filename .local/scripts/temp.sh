#!/bin/bash

therm=$(cat /proc/acpi/ibm/thermal | awk '{print $2}')


if [ "$therm" -ge 70 ]; then
    color="#cc241d"
elif [ "$therm" -ge 30 ]; then
    color="#fabd2f"
fi


printf "<span color='%s'> %s%s%s </span>\n" "$color" "$(echo " $therm")°C"
