" Configuration file for Vim text editor
"
" Shared non-GUI settings for both console Vim and gVim. Additional
" GUI-specific settings are in the 'gvimrc' file.
"
" Latest revision: 2026-04-21
"
" Created and unlicensed by Mikołaj Bartnicki <mikolaj@bartnicki.org>;
" please read UNLICENSE file for details.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Work as Vi Improved instead of pure Vi. It must be the first setting.
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set displayed language.
language en_US.utf8

" Set font encoding.
set encoding=utf8

" Set file writing encoding.
set fileencoding=utf8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Confirm ':q' in case of unsaved changes.
set confirm

" Don't make backup~ files.
set nobackup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't break long lines.
set textwidth=0

" Fill tabs with spaces (press [Ctrl]+[V] [Tab] to insert real tab character).
set expandtab

" Set tabstop size - number of columns.
set tabstop=4

" Set number of spaces for [Tab] and [Backspace] when 'expandtab' is used.
set softtabstop=4

" Set code indentation depth.
set shiftwidth=4

" Tune code indentation, see ':help cinoptions-values' for details.
set cinoptions=:0g0(0

" Keep indentation when breaking long lines.
set breakindent

" Don't break long lines in the middle of a word.
set linebreak

" Don't put an extra space after a dot when joining lines.
set nojoinspaces

" Make [Backspace] work over everything in INSERT mode.
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results.
set hlsearch

" Do incremental search.
set incsearch

" Do case insensitive search...
set ignorecase

" ...unless a capital letter is used.
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display cursor position at the bottom of the screen.
set ruler

" Use the following characters to display non-printable characters.
set listchars=eol:$,tab:>-,space:.,trail:.,extends:+,precedes:+,conceal:=,nbsp:_

" Use dark background.
set background=dark

" Use 'retrobox' color scheme.
colorscheme retrobox

" Enable syntax highlighting.
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype detection.
filetype on

" Load plugins specific for file types.
filetype plugin on

" Automatically indent code.
filetype indent on

" Enable '_j' keymap for text justification.
runtime macros/justify.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run the following commands automatically.
if has("autocmd")
    " Wrap lines at 80th column in Plain Text files.
    autocmd FileType text setlocal textwidth=80

    " Wrap lines at 100th column in Rust source code files.
    autocmd FileType rust setlocal textwidth=100

    " Wrap lines at 72nd column in git commit messages.
    autocmd BufNewFile,BufReadPre COMMIT_EDITMSG setlocal textwidth=72

    " Wrap lines at 72nd column in alpine e-mail client.
    autocmd BufNewFile,BufReadPre /tmp/pico.* setlocal textwidth=72

    " Use 2 spaces for code indentation in HTML files.
    autocmd FileType html setlocal et ts=2 sts=2 sw=2

    " Use 2 spaces for code indentation in YAML files.
    autocmd FileType yaml setlocal et ts=2 sts=2 sw=2

    " Use hard tab for code indentation in Go source code.
    autocmd FileType go setlocal noet ts=4 sts=4 sw=4

    " Delete empty or whitespace-only lines at the end of file.
    autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

    " Reduce each group of empty or whitespace-only lines to one empty line.
    autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

    " Delete all trailing white spaces (caution when editing Markdown).
    autocmd BufWritePre * :%s/\s\+$//ge

    " Restore a trailing space in e-mail signature separator (for Alpine).
    autocmd BufWritePre /tmp/pico.* :%s/^--$/--\ /ge

    " Format source code in the current buffer using the external tool.
    " Parameters:
    "   formatter - the external formatting command.
    " Example:
    "   Format_source_code("gofmt")
    function! Format_source_code(formatter)
        let l:pos = getpos(".")
        execute '1,$!' . a:formatter
        call setpos('.', l:pos)
    endfunction

    " Format Go source code on save.
    if executable("gofmt")
        autocmd BufWritePre *.go call Format_source_code("gofmt")
    endif

    " Format Rust source code on save.
    if executable("rustfmt")
        autocmd BufWritePre *.rs call Format_source_code("rustfmt")
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Center the view on the next search result.
nnoremap n nzz
nnoremap N Nzz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F1] to toggle showing non-printable characters (default [F1] is :help).
nnoremap <F1> :set list!<CR>
inoremap <F1> <C-o>:set list!<CR>

" Press [Ctrl]+[F1] to toggle line numbers display mode.
nnoremap <C-F1> :set number!<CR>:set relativenumber!<CR>
inoremap <C-F1> <C-o>:set number!<CR><C-o>:set relativenumber!<CR>

" Press [Alt]+[F1] to toggle background between light and dark.
nnoremap <M-F1> :let &bg = (&bg == "dark" ? "light" : "dark")<CR>
inoremap <M-F1> <C-o>:let &bg = (&bg == "dark" ? "light" : "dark")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F2] to set 2 columns wide tabs and fill them with spaces.
nnoremap <F2> :set expandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>
inoremap <F2> <C-o>:set expandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>

" Press [Ctrl]+[F2] to set 2 columns wide tabs and use real tab characters.
nnoremap <C-F2> :set noexpandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>
inoremap <C-F2> <C-o>:set noexpandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F3] to set 4 columns wide tabs and fill them with spaces.
nnoremap <F3> :set expandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>
inoremap <F3> <C-o>:set expandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>

" Press [Ctrl]+[F3] to set 4 columns wide tabs and use real tab characters.
nnoremap <C-F3> :set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>
inoremap <C-F3> <C-o>:set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F4] to set 8 columns wide tabs and fill them with spaces.
nnoremap <F4> :set expandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>
inoremap <F4> <C-o>:set expandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>

" Press [Ctrl]+[F4] to set 8 columns wide tabs and use real tab characters.
nnoremap <C-F4> :set noexpandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>
inoremap <C-F4> <C-o>:set noexpandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F5] to turn search results highlighting off.
nnoremap <F5> :nohl<CR>
inoremap <F5> <C-o>:nohl<CR>

" Press [Ctrl]+[F5] to toggle highlighting of the cursor line.
nnoremap <C-F5> :set cursorline!<CR>
inoremap <C-F5> <C-o>:set cursorline!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F6] to Polish spellcheck (z= for proposed corrections).
nnoremap <F6> :set spell! spelllang=pl<CR>
inoremap <F6> <Esc>:set spell! spelllang=pl<CR>

" Press [Ctrl]+[F6] to English spellcheck (z= for proposed corrections).
nnoremap <C-F6> :set spell! spelllang=en<CR>
inoremap <C-F6> <Esc>:set spell! spelllang=en<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F7] to fix indentation in the whole file.
nnoremap <F7> mxggVG=`xzz
inoremap <F7> <Esc>mxggVG=`xzza

" Press [Ctrl]+[F7] to justify current paragraph (macros/justify.vim required).
nmap <C-F7> mxvip_j`xzz
imap <C-F7> <Esc>mxvip_j`xzza

" Press [Alt]+[F7] to justify the whole file (macros/justify.vim required).
nmap <M-F7> mx_j`xzz
imap <M-F7> <Esc>mx_j`xzza

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F8] to sort current paragraph.
nnoremap <F8> mxvip:sort<CR>`xzz
inoremap <F8> <Esc>mxvip:sort<CR>`xzza

" Press [Ctrl]+[F8] to sort current paragraph removing duplicate lines.
nnoremap <C-F8> mxvip:sort u<CR>`xzz
inoremap <C-F8> <Esc>mxvip:sort u<CR>`xzza

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F9] to automatically break long lines at 50th column.
nnoremap <F9> :set textwidth=50<CR>
inoremap <F9> <C-o>:set textwidth=50<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F10] to automatically break long lines at 72nd column.
nnoremap <F10> :set textwidth=72<CR>
inoremap <F10> <C-o>:set textwidth=72<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F11] to automatically break long lines at 80th column.
nnoremap <F11> :set textwidth=80<CR>
inoremap <F11> <C-o>:set textwidth=80<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press [F12] to disable breaking long lines.
nnoremap <F12> :set textwidth=0<CR>
inoremap <F12> <C-o>:set textwidth=0<CR>
