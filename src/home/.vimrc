" RESET

set nocompatible

" INDENTATION

set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2

autocmd BufWritePre * %s/\s\+$//e
filetype plugin indent on

" SEARCH

set hlsearch
set ignorecase
set incsearch
set smartcase

" INTERFACE

set backspace=indent,eol,start
set cursorline
set laststatus=2
set mouse=a
set noerrorbells
set number
set ruler
set showmatch
set showmode
set title
set visualbell
set wildignorecase
set wildmenu
set wildmode=list:longest

" PERFORMANCE

set lazyredraw
set nottyfast

" TEXT

set linebreak
set scrolloff=5
set sidescrolloff=5
set wrap

syntax on

" FOLDING

set foldmethod=indent
set nofoldenable

" SYSTEM

set autoread
set confirm
set history=999
set undolevels=999
