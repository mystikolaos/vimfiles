" Configuration file for gVim text editor
"
" GUI-specific settings for gVim that complement the shared configurations
" defined in the 'vimrc' file. This file is an extension of 'vimrc' and does
" not replace it. Make sure both are properly placed.
"
" Latest revision: 2026-04-21
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
" Parameters:
"   size - desired font size.
" Example:
"   Set_font(12)
function! Set_font(size)
    if has("unix")
        execute 'set guifont=Monospace\ ' . a:size
    elseif has("windows")
        execute 'set guifont=Consolas:h' . a:size . ':cEASTEUROPE'
    endif
endfunction

" Set the default font size.
call Set_font(12)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [Ctrl]+[F9] to set font size to 10.
nnoremap <C-F9> :call Set_font("10")<CR>
inoremap <C-F9> <C-o>:call Set_font("10")<CR>

" Press [Ctrl]+[F10] to set font size to 12.
nnoremap <C-F10> :call Set_font("12")<CR>
inoremap <C-F10> <C-o>:call Set_font("12")<CR>

" Press [Ctrl]+[F11] to set font size to 14.
nnoremap <C-F11> :call Set_font("14")<CR>
inoremap <C-F11> <C-o>:call Set_font("14")<CR>

" Press [Ctrl]+[F12] to set font size to 16.
nnoremap <C-F12> :call Set_font("16")<CR>
inoremap <C-F12> <C-o>:call Set_font("16")<CR>
