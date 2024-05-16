#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$HOME/.local/scripts:$PATH
export TERMINAL='kitty'
export EDITOR='nvim'
export BROWSER='vivaldi'
export BIB='$HOME/01_personal/02_resources/20240000_bibliography.bib'


# Aliases

alias gh='cd ~/'
alias gd='cd $HOME/04_temporary/02_web_downloads/'
alias gm='cd $HOME/03_entertainment/05_music/'
alias gw='cd $HOME/02_work/05_personal_website/'
alias gzif='cd $HOME/02_work/03_zif/'
alias gb='cd $HOME/02_work/04_avennathan/'
alias gs='cd $HOME/.local/scripts/'



alias p='sudo pacman'
alias q='exit'



alias nwm='cd $HOME/.local/suckless/dwm/ && nvim config.def.h'
alias nsb='cd $HOME/.local/suckless/dwmblocks/ && nvim $HOME/.local/suckless/dwmblocks/blocks.def.h'
alias nvi='nvim $HOME/.config/nvim/init.vim'
alias thesis='nvim $HOME/01_personal/01_areas/05_education/01_masters/11_thesis/01_tex/main.tex'

# aliases to update the status bar modules
alias utemp='kill -38 $(pidof dwmblocks)'
alias upack='kill -42 $(pidof dwmblocks)'
alias ufore='kill -39 $(pidof dwmblocks)'
alias utime='kill -36 $(pidof dwmblocks)'
alias uconn='kill -39 $(pidof dwmblocks)'

# blesh
[[ $- == *i* ]] && source /usr/share/blesh/ble.sh
