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

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
