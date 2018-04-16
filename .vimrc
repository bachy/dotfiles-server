set encoding=utf-8
set directory=~/.vim/swp " *.swp files will end up here


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When editing a file, always jump to the last known cursor position.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing whitespaces on saving a file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * :%s/\s\+$//e

syntax on
set t_Co=256
let g:molokai_termcolors=256
colorscheme molokai

au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx
