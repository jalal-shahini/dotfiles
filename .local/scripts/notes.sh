#!/bin/sh

lastrun=$(cat $HOME/Documents/Personal/Notes/.backend/.lastrun)

current_normal=$(date +%d.%m.%Y-%H:%M:%S)
echo "---
$current_normal" >> $HOME/Documents/Personal/Notes/.backend/.log

if [ "$1" == "-f" ]; then
    rm $HOME/Documents/Personal/Notes/Archive_HTML/*.html
    rm $HOME/Documents/Personal/Notes/Archive_HTML/*.bak
    rm $HOME/Documents/Personal/Notes/Archive_HTML/diary/*.html
    rm $HOME/Documents/Personal/Notes/Archive_HTML/diary/*.bak

fi

cd $HOME/Documents/Personal/Notes/Archive/

for file in *.md
do
    last_modified=$(date +%s -r $file)
    if [ -e $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html ]; then
        if [ $last_modified -gt $lastrun ]
        then
        pandoc $file --standalone --quiet --toc --mathjax --citeproc -o "$HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html" --css="$HOME/Documents/Personal/Notes/.backend/j.css" --bibliography="$BIB"
        # add .html to all links
        sed -i.bak '/href/s/">/.html">/g' $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html
        # remove .html from links that lead to a local file (now just for .mp4 and .pptx)
        sed -i.bak '/href/s/.mp4.html">/.mp4">/g' $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html
        sed -i.bak '/href/s/.pptx.html">/.pptx">/g' $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html
        # remove the added .html from the end of links to the web
        sed -i.bak '/href="http/s/.html">/">/g' $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html
        # remove the added .html from the end of links to the same page (--toc)
        sed -i.bak '/="#/s/.html">/">/g' $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html
        echo "The file \"$file\" is changed."
        echo "$(date +%s): $file is changed." >> $HOME/Documents/Personal/Notes/.backend/.log
        fi
    else
        pandoc $file --standalone --quiet --toc --mathjax --citeproc -o "$HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html" --css="$HOME/Documents/Personal/Notes/.backend/j.css" --bibliography="$BIB"
        # add .html to all links
        sed -i.bak '/href/s/">/.html">/g' $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html
        # remove .html from links that lead to a local file (now just mp4s)
        sed -i.bak '/href/s/.mp4.html">/.mp4">/g' $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html
        # remove the added .html from the end of links to the web
        sed -i.bak '/href="http/s/.html">/">/g' $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html
        # remove the added .html from the end of links to the same page (--toc)
        sed -i.bak '/="#/s/.html">/">/g' $HOME/Documents/Personal/Notes/Archive_HTML/${file%.md}.html
        echo "The file \"$file\" is added."
        echo "$(date +%s): $file is added." >> $HOME/Documents/Personal/Notes/.backend/.log
    fi
done



cd $HOME/Documents/Personal/Notes/Archive/diary


for file in *.md
do
    last_modified=$(date +%s -r $file)
    if [ -e $HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html ]; then
        if [ $last_modified -gt $lastrun ]
        then
        pandoc $file --standalone --quiet --mathjax --citeproc -o "$HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html" --css="$HOME/Documents/Personal/Notes/.backend/j.css" --bibliography="$BIB"
        # add .html to all links
        sed -i.bak '/href/s/">/.html">/g' $HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html
        # remove .html from links that lead to a local file (now just mp4s)
        sed -i.bak '/href/s/.mp4.html">/.mp4">/g' $HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html
        # remove the added .html from the end of links to the web
        sed -i.bak '/href="http/s/.html">/">/g' $HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html
        # remove the added .html from the end of links to the same page (--toc)
        sed -i.bak '/="#/s/.html">/">/g' $HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html
        echo "The file \"$file\" is changed."
        echo "$(date +%s): $file is changed." >> $HOME/Documents/Personal/Notes/.backend/.log
        fi
    else
        pandoc $file --standalone --quiet --mathjax --citeproc -o "$HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html" --css="$HOME/Documents/Personal/Notes/.backend/j.css" --bibliography="$BIB"
        # add .html to all links
        sed -i.bak '/href/s/">/.html">/g' $HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html
        # remove .html from links that lead to a local file (now just mp4s)
        sed -i.bak '/href/s/.mp4.html">/.mp4">/g' $HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html
        # remove the added .html from the end of links to the web
        sed -i.bak '/href="http/s/.html">/">/g' $HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html
        # remove the added .html from the end of links to the same page (--toc)
        sed -i.bak '/="#/s/.html">/">/g' $HOME/Documents/Personal/Notes/Archive_HTML/diary/${file%.md}.html
        echo "The file \"$file\" is added."
        echo "$(date +%s): $file is added." >> $HOME/Documents/Personal/Notes/.backend/.log
    fi
done

# Removing html files corresponding to the deleted md files.
cd $HOME/Documents/Personal/Notes/Archive_HTML

for file in *.html
do
    if [ ! -e $HOME/Documents/Personal/Notes/Archive/${file%.html}.md ]; then
        rm $file
        echo "The file \"$file\" is removed."
        echo "$(date +%s): $file is removed." >> $HOME/Documents/Personal/Notes/.backend/.log
    fi
done


cd $HOME/Documents/Personal/Notes/Archive_HTML/diary

for file in *.html
do
    if [ ! -e $HOME/Documents/Personal/Notes/Archive/diary/${file%.html}.md ]; then
        rm $file
        echo "The file \"$file\" is removed."
        echo "$(date +%s): $file is removed." >> $HOME/Documents/Personal/Notes/.backend/.log
    fi
done

current=$(date +%s)
echo "$current" > $HOME/Documents/Personal/Notes/.backend/.lastrun
