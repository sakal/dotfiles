set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on

" call pathogen#helptags()

if has('mouse')
  " have the mouse enabled all the time
  set mouse=a
  " make a menu popup on right click
  set mousemodel=popup
endif

set ruler
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set showmatch
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab

set number
set numberwidth=4


" turn off smart indentation when pasting
set pastetoggle=<F2>
" " shortcut for pasting clipboard contents
map <silent> <leader>* "+gP


" find as you type
set incsearch
" highlight the terms
set hlsearch
" make searches case-insensitive
set ignorecase
" unless they contain upper-case letters
set smartcase
" a toggle for search highlight
map <silent> <leader>h :set hlsearch!<CR>

" Colors and Syntax                                            {{{1
" -----------------------------------------------------------------

" turn on syntax highlighting
syntax on

" highlight all python syntax
let python_highlight_all=1

" gui and terminal compatible color scheme
set t_Co=256
" set background=dark
" set global variables that will define the colorscheme
let g:light_theme='zenburn'
let g:dark_theme='zenburn'

" Use the "original" molokai theme colors instead of "dark"
"let g:molokai_original=1

" Zenburn settings
" let g:zenburn_alternate_Error = 1

" Solarized settings
" let g:solarized_termcolors=16

" let g:zenburn_alternate_Visual = 1
let g:zenburn_old_Visual = 1

" Command to call the ColorSwitch funciton
command! -nargs=? -complete=customlist,s:completeColorSchemes ColorSwitcher :call s:colorSwitch(<q-args>)

function! s:extraHighlights()
    " Syntax highlights for the mappings set above
    hi InterestingWord1 guifg=#000000 guibg=#FF4300
    hi InterestingWord2 guifg=#000000 guibg=#53FF00
    hi InterestingWord3 guifg=#000000 guibg=#FF74F8
    hi IndentGuides                   guibg=#373737
endfunction

" A function to toggle between light and dark colors
function! s:colorSwitch(...)
    " function to switch colorscheme
    function! ChangeMe(theme)
        execute('colorscheme '.a:theme)
        try
            execute('colorscheme '.a:theme.'_custom')
        catch /E185:/
            " There was no '_custom' scheme...
        endtry
    endfunction

    " Change to the specified theme
    if eval('a:1') != ""
        " check to see if we are passing in an existing var
        if exists(a:1)
            call ChangeMe(eval(a:1))
        else
            call ChangeMe(a:1)
        endif
        " Put the extra highlights back in place
        call s:extraHighlights()
        return
    endif

    " Toggle between a light and dark vim colorscheme
    " This also takes care of the solarized scheme
    if &background == 'dark'
        set background=light
        call ChangeMe(g:light_theme)
    elseif &background == 'light'
        set background=dark
        call ChangeMe(g:dark_theme)
    endif

    " Put the extra highlights back in place
    call s:extraHighlights()
endfunction

" completion function for colorscheme names
function! s:completeColorSchemes(A,L,P)
    let colorscheme_names = []
    for i in split(globpath(&runtimepath, "colors/*.vim"), "\n")
        let colorscheme_name = fnamemodify(i, ":t:r")
        if stridx(colorscheme_name, "_custom") < 0
            call add(colorscheme_names, colorscheme_name)
        endif
    endfor
    return filter(colorscheme_names, 'v:val =~ "^' . a:A . '"')
endfunction

" set the colorscheme
ColorSwitcher g:dark_theme



set cuc cul

if &bg == 'dark' 
    hi CursorLine ctermbg=darkgrey ctermfg=white cterm=bold
else 
    " hi CursorLine gui=NONE guibg=#CCCCCC ctermbg=darkblue cterm=bold
    hi CursorLine guifg=darkgray ctermbg=darkgrey term=bold

endif 
hi! link CursorColumn CursorLine 

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
au BufLeave * set nocursorline nocursorcolumn
au BufEnter * set cursorline cursorcolumn

let g:user_zen_leader_key = '<c-e>'

let NERDTreeIgnore = ['\.pyc$']
" shortcuts
nnoremap <silent> <F3> :TagbarToggle<CR>
map <leader>p :NERDTreeToggle<CR>
vmap <leader>p :NERDTreeToggle<CR>i
imap <leader>p :NERDTreeToggle<CR>i

map <leader><Tab> :bn<CR>
map <leader><S-Tab> :bp<CR>

