#!/bin/sh


bookmark="$(xclip -o)"
file="$HOME/01_personal/03_cloud/01_dropbox/20240000_bookmarks"

if grep -q "^$bookmark$" "$file"; then
    notify-send "Bookmarks" "Already bookmarked."
else
    notify-send "Bookmarks" "$bookmark added."
    echo "$bookmark" >> "$file"
fi

sort -rfo $file $file
