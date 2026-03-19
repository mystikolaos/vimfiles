" Configuration file for Vim text editor
"
" Latest revision: 2026-03-19
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
    " - formatter: the external formatting command.
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
