#!/bin/bash

UUIDST=df81670d-b34c-4766-95cc-054a523478a3

A=0

lsblk -f | grep $UUIDST | grep -wq "/mnt/Backup_Storage" && A=1


if [ $A = 1 ]; then
    rsync -rltP --delete --exclude '/home/omid/.cache/**' /home/omid  /mnt/Backup_Storage


    echo "Backup Done!" && notify-send -t 5000 "Backup Script" "Main storage backup is done!"
else
    echo "Backup media is not connected." && notify-send -t 5000 "Backup Script" "Backup media is not connected."
fi

UUIDSD=bff75404-c50b-4ee2-9125-3f418d327ceb

B=0

lsblk -f | grep $UUIDSD | grep -wq "/mnt/SD" && B=1


if [ $B = 1 ]; then
    rsync -rltP --delete /home/omid/Documents/Personal/Education/Master  /mnt/SD &&
        rsync -rltp --delete /home/omid/Documents/Personal/Library/r.bib /mnt/SD &&


    echo "Backup Done!" && notify-send -t 5000 "Backup Script" "SD backup is done!"
else
    echo "Backup media is not connected." && notify-send -t 5000 "Backup Script" "SD card is not connected."
fi
