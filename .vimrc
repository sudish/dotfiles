set tabstop=8 sw=2 softtabstop=2 smarttab expandtab smartindent
set nocompatible history=100 incsearch ruler showcmd title titleold=
set ignorecase smartcase scrolloff=1 sidescrolloff=1 paste

filetype plugin indent on
if has("syntax")
  syntax enable
endif

set background=dark
set t_Co=256
packadd! dracula
colorscheme dracula
