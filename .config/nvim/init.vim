let mapleader=" "

call plug#begin()

" vimplug
" :PlugInstall to install the plugins
" :PlugUpdate to install or update the plugins
" :PlugDiff to review the changes from the last update
Plug 'vimwiki/vimwiki'

call plug#end()

set nocompatible
set hlsearch
set autoindent
set number relativenumber
set encoding=utf-8
set mouse=a
set termguicolors
syntax on

let g:vimwiki_list = [{'path': '~/01_personal/02_resources/06_notes/01_vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" system clipboard
set clipboard+=unnamedplus

" file type set
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.md set filetype=markdown


" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" spell check
map <leader>se :setlocal spell! spelllang=en_us<CR>
map <leader>sd :setlocal spell! spelllang=de_de<CR>


" split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>


" alias write and quit
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" replace all is aliased to S
nnoremap S :%s//g<Left><Left>

" bib file
map <leader>b :vsp<space>$BIB<CR>

source ~/.config/nvim/latex_keymaps.vim

