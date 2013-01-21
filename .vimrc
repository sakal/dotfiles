execute pathogen#infect()
syntax on
filetype plugin indent on

" call pathogen#helptags()

set ruler
set tabstop=4
set shiftwidth=4
set expandtab

set number
set numberwidth=4

set cuc cul

if &bg == 'dark' 
    hi CursorLine gui=NONE guibg=#333333 
else 
    hi CursorLine gui=NONE guibg=#CCCCCC 
endif 
hi! link CursorColumn CursorLine 

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set colorcolumn=78

