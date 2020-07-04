set encoding=utf-8

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
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
set tabstop=4
set shiftwidth=4
" Don’t add empty newlines at the end of files
set noeol
" Show the current mode
set showmode
" Don't create swapfile
set noswapfile

" Keybind, move to beginning/end of line
nnoremap B ^
nnoremap E $

" Change mapleader
let mapleader=","
" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

"Copy and paste to the system clipboard
vnoremap <C-c> "+y
map <C-v> "+P
