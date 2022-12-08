set encoding=utf-8

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" install gvim or vim-gtk
set clipboard=unnamedplus
" Enable syntax highlithing
syntax on
" Search as characters are entered
set incsearch
" Highlight matches
set hlsearch
" Highlight matching [{()}]
set showmatch
" Enable line numbers
set number
set relativenumber
" tabs are spaces
set expandtab
" tabs are 4 spaces
set tabstop=2
set shiftwidth=2
" Don’t add empty newlines at the end of files
set noeol
" Show the current mode
set showmode
" Don't create swapfile
" set noswapfile

" Keybind, move to beginning/end of line
nnoremap B ^
nnoremap E $
