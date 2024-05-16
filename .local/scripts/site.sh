#!/bin/sh
rsync -uvrP --delete-after --exclude-from=$HOME/Documents/Work/Website/.git/ $HOME/Documents/Work/Website/public/ root@172.104.246.79:/var/www/jalalshahini
