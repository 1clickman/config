" Hello World!

source ~/.vim/bundles.vim

" Junk for 256 colors
set term=builtin_xterm
set t_Co=256

" Color Scheme
syntax enable
set background=dark
colorscheme solarized

" Paren Highlighting
hi MatchParen cterm=bold ctermbg=none ctermfg=31

" Autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
filetype indent on

" Autocomplete vim commands
set wildmenu
set wildmode=list:longest,full

" Remap semicolon to colon
nore ; :

" Set scroling to be fluid and show more
set sidescrolloff=5
set scrolloff=5

set showcmd
set showmode
set number

"Paste indent

inoremap jj <Esc>

let mapleader = ","

nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l

" Strip trailing whitespace on save:
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

let g:html_indent_inctags = "html,body,head,tbody"

source ~/.vim/plugins.vim
nore p ]p
