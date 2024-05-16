#!/bin/sh


curl $1 > /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html


title=$(grep 'citation_title' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html | sed 's/^.*content=\"//;s/\".*$//')
author_name=$(grep 'citation_author' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html | sed 's/^.*content=\"//;s/\".*$//')
pub_date=$(grep 'DCTERMS.issued' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html | sed 's/^.*content=\"//;s/\".*$//')
pub_modified=$(grep 'DCTERMS.modified' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html | sed 's/^.*content=\"//;s/\".*$//')


# Removing unwanted elements
sed -i 's/<script.*<\/script>//g;' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
sed -i '/<div id="header-wrapper">/,/End header wrapper/d' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
sed -i '/<div id="article-sidebar"/,/<!-- End article sidebar -->/d' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
sed -i '/<div id="footer">/,/<!-- End footer -->/d' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
sed -i '/<div id="related-entries">/,/<\/div>/d' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
sed -i '/<div id="academic-tools">/,/<\/div>/d' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
sed -i '/<div id="other-internet-resources">/,/<\/div>/d' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
sed -i '/<div id="acknowledgments">/,/<\/div>/d' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
sed -i '/<div id="article-copyright">/,/<\/div>/d' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
sed -i '/<div id="article-banner"/,/End article-banner -->/d' /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html

# Creating yaml metadata
echo -e '<dc:creator>'$author_name'</dc:creator>' > "/home/omid/Documents/Personal/Library/Encyclopedia_Entries/$title.xml"


# Create Cover
echo -e $title | magick -gravity center -background white -fill black -font /usr/share/fonts/TTF/DejaVuSerif.ttf -size 1600x1280 -pointsize 200 caption:@- /tmp/en1.png
echo -e $author_name | magick -gravity center -background white -fill black -font /usr/share/fonts/TTF/DejaVuSerif.ttf -size 1600x1280 -pointsize 150 caption:@- /tmp/en2.png
convert /tmp/en1.png /tmp/en2.png -append /tmp/en3.png
convert /tmp/en3.png /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.sep-man-red_2.png -gravity center -composite -matte /tmp/encyclopedia.png

# Converting to epub
pandoc /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html --epub-cover="/tmp/encyclopedia.png" --epub-metadata="/home/omid/Documents/Personal/Library/Encyclopedia_Entries/$title.xml" --mathjax -t epub -o "/home/omid/Documents/Personal/Library/Encyclopedia_Entries/$title.epub" && notify-send "Stanford Encyclopedia" "$title Converted to epub."

# Emailing to kindle
echo $title | neomutt -s "$title" -a "/home/omid/Documents/Personal/Library/Encyclopedia_Entries/$title.epub" -- jalal_cqlucs@kindle.com && notify-send "Stanford Encycolpedia" "Sent to Kindle."

# Convert to pdf

#pandoc -f epub $HOME/Documents/Personal/Library/Encyclopedia_Entries/$title.epup -V geometry:margin=1in --pdf-engine=xelatex -t pdf -o $HOME/Documents/Personal/Library/Texts/$author_name\_$pub_date\_$title.pdf

# Removing the temporary html file
rm /home/omid/Documents/Personal/Library/Encyclopedia_Entries/.tmp.html
rm /tmp/encyclopedia.png
rm /tmp/en1.png
rm /tmp/en2.png
rm /tmp/en3.png

xsel -cb

#notify-send "Kindle" "Your selected entry is sent to Kindle!"

