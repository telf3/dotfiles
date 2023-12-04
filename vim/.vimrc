set encoding=utf-8

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" Check with vim --version | grep clipboard
" install gvim or vim-gtk
set clipboard=unnamedplus

" Enable syntax highlithing
syntax on

" Search as characters are entered
set incsearch

" Highlight matches
set nohlsearch

" Highlight matching [{()}]
set showmatch

" Case-insensitive searching UNLESS \C or capital in search
set ignorecase
set smartcase

" Enable line numbers
set number
"set relativenumber

" Indentation
set breakindent
set expandtab
set tabstop=2
set shiftwidth=2

" Don’t add empty newlines at the end of files
"set noeol

" Show the current mode
set showmode

" Save undo history
set undofile

" Don't create swapfile
" set noswapfile

" Enable mouse in visual mode
set mouse=a
