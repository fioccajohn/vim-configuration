" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The plugin makes the % command work better, but it is not backwards
" comp
" The the package won't be loaded right away but when plugins are
" loadg initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set backspace=indent,eol,start
set ruler
set showcmd
set wildmenu
set ttimeout
set ttimeoutlen=100
set display=truncate
map Q gq
inoremap <C-U> <C-G>u<C-U>

if has('mouse')
	set mouse=a
endif
filetype plugin indent on

set whichwrap=b,s,<,>,[,]
set listchars=tab:>-,trail:-


set ignorecase
set smartcase
set linebreak
set nowrapscan
" set rnu
set number
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//
set directory=~/.vim/swap//
set nowrap
set hlsearch
set incsearch
" folding
set foldmethod=syntax
set foldcolumn=2
set foldopen=all
set foldclose=all
set number

set notgc
syntax enable
set bg=dark
colorscheme PaperColor

set omnifunc=syntaxcomplete#Complete

" add spelling dictionary to the completion list
set complete+=kspell

packadd! matchit

" auto spell for md
autocmd BufRead,BufNewFile *.md,*.fountain setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md,*.fountain set wrap

" Thesaurus
set thesaurus+=~/.vim/thesaurus/mthesaur.txt

" Dictionary
set dictionary+=/usr/share/dict/words

" Tabs
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set softtabstop=4   " Number of spaces that a <Tab> counts for while editing

" Fountain file type
au BufRead,BufNewFile *.fountain setlocal filetype=fountain 

" HTML tab fix
au BufRead,BufNewFile *.html setlocal tabstop=2

" John's configurations
let mapleader = "\\"
nnoremap <Leader>s :norm 1z=<CR>
nnoremap <Leader>y :%y+<CR>
nnoremap <Leader>d :%d<CR>
nnoremap <Leader>p :norm "*p<CR>

" John's custom functions
