#!/bin/sh


rsync -uvrP --delete-after --exclude-from=$HOME/Documents/Work/Avennathan/.git/ $HOME/Documents/Work/Avennathan/public/ root@172.104.246.79:/var/www/avennathan
