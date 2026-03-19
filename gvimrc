" Configuration file for gVim text editor
"
" GUI-specific settings for gVim that complement the shared configurations
" defined in the 'vimrc' file. This file is an extension of 'vimrc' and does
" not replace it. Make sure both are properly placed.
"
" Latest revision: 2026-03-19
"
" Created and unlicensed by Mikołaj Bartnicki <mikolaj@bartnicki.org>;
" please read UNLICENSE file for details.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set window width - number of columns.
set columns=85

" Set window height - number of lines.
set lines=25

" Display line numbers on the left margin.
set number

" Use light background.
set background=light

" Use 'retrobox' color scheme.
colorscheme retrobox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font face and size.
" - size: desired font size.
function! Set_font(size)
    if has("unix")
        execute 'set guifont=Monospace\ ' . a:size
    elseif has("windows")
        execute 'set guifont=Consolas:h' . a:size . ':cEASTEUROPE'
    endif
endfunction

" Set the default font size.
call Set_font(12)
