#!/bin/bash

chosen=$(echo -e "Laptop\nDisplayPort+Laptop\nDisplayPort" | rofi -dmenu -i)

case "$chosen" in
    Laptop) laptop.sh && nitrogen --restore ;;
    DisplayPort+Laptop) displayport_laptop.sh && nitrogen --restore ;;
    DisplayPort) displayport.sh && nitrogen --restore ;;

esac

