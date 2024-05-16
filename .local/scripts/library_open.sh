#!/bin/bash

function handler(){
	ans=$(echo -e "Zathura\nOkular" | rofi -dmenu -i)
	case "$ans" in
		Zathura) zathura "$HOME/01_personal/02_resources/01_texts/$file" ;;
		Okular) okular "$HOME/01_personal/02_resources/01_texts/$file" ;;
	esac
}


cd $HOME/01_personal/02_resources/01_texts/

file=$(ls * | rofi -dmenu -i)
[ -z "$file" ] || handler
