set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on

" call pathogen#helptags()

set ruler
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab

set number
set numberwidth=4

set cuc cul

if &bg == 'dark' 
    hi CursorLine gui=NONE guibg=#FFFFFF ctermbg=darkcyan ctermfg=white cterm=bold
else 
    hi CursorLine gui=NONE guibg=#CCCCCC ctermbg=darkblue cterm=bold
endif 
hi! link CursorColumn CursorLine 

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
let g:user_zen_leader_key = '<c-e>'

