#!/bin/sh


notes.sh | while read OUTPUT; do notify-send -t 3000 "Conversion" "$OUTPUT"; done

[ -e $HOME/.local/Dropbox/notes.zip.gpg ] && rm $HOME/.local/Dropbox/notes.zip.gpg

zip -r $HOME/.local/notes.zip $HOME/Documents/Personal/Notes/ && gpg --encrypt -r jst@jalalshahini.com $HOME/.local/notes.zip && rm $HOME/.local/notes.zip && mv $HOME/.local/notes.zip.gpg $HOME/.local/Dropbox/notes.zip.gpg && notify-send -t 4000 "Backup" "Notes are compressed, encrypted, and synced to Dropbox."|| notify-send -t 4000 "Backup Failed" "Compressing or encrypting note files failed.!"

[ -e $HOME/.local/Dropbox/r.zip.gpg ] && rm $HOME/.local/Dropbox/r.zip.gpg

zip $HOME/.local/r.zip $HOME/Documents/Personal/Library/r.bib && gpg --encrypt -r jst@jalalshahini.com $HOME/.local/r.zip && rm $HOME/.local/r.zip && mv $HOME/.local/r.zip.gpg $HOME/.local/Dropbox/r.zip.gpg && notify-send -t 4000 "Backup" "The BIB file is compressed, encrypted, and synced to Dropbx." || notify-send -t 4000 "Backup Failed" "Compressing or encrypting bib file failed.!"
