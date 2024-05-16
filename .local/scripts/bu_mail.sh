#!/bin/sh


[ -e $HOME/Dropbox/mail.zip.gpg ] && mv $HOME/Dropbox/mail.zip.gpg $HOME/Dropbox/mail.zip.gpg.old


zip -r $HOME/.local/share/mail.zip $HOME/.local/share/mail/ && gpg --encrypt -r jst@jalalshahini.com $HOME/.local/share/mail.zip && rm $HOME/.local/share/mail.zip && mv $HOME/.local/share/mail.zip.gpg $HOME/Dropbox/mail.zip.gpg && notify-send -t 5000 "Backup" "Email backup was successfull." && rm $HOME/Dropbox/mail.zip.gpg.old || notify-send -t 5000 "Backup" "Email backup failed."
