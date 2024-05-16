#!/bin/sh


[ -e $HOME/Dropbox/fin.zip.gpg ] && mv $HOME/Dropbox/fin.zip.gpg $HOME/Dropbox/fin.zip.gpg.old


zip -r $HOME/.local/share/fin.zip $HOME/Documents/Personal/Finances/ && gpg --encrypt -r jst@jalalshahini.com $HOME/.local/share/fin.zip && rm $HOME/.local/share/fin.zip && mv $HOME/.local/share/fin.zip.gpg $HOME/Dropbox/fin.zip.gpg && notify-send -t 5000 "Backup" "Finances backup was successfull." && rm  $HOME/Dropbox/fin.zip.gpg.old || notify-send -t 5000 "Backup" "Finances backup failed."
