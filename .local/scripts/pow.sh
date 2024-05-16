#!/bin/bash

function sd(){
    ans=$(echo -e "Yes\nNo" | rofi -dmenu -i -p "Are you sure to shutdown?")

case "$ans" in
  Yes) shutdown now ;;
esac
}

choice=$(echo -e "Lock\nSuspend\nHibernate\nReboot\nShutdown" | rofi -dmenu -i)

case "$choice" in
    Lock) i3lock -c 00004C ;;
    Suspend) i3lock -c 00004C & systemctl suspend ;;
    Hibernate) i3lock -c 00004C & systemctl hibernate ;;
    Reboot) systemctl reboot ;;
        Shutdown) systemctl poweroff ;;
esac
