" MY CONFIG SETTINGS
" Copied from Neural Nine
set number                  " add line numbers
set relativenumber          " Relative Numbers
set autoindent              " indent a new line to align with line just typed
set tabstop=4               " number of columns occupied by a tab
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops
set smarttab
set mouse=a                 " middle-click paste with

" Config as copied from builtin.com
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set hlsearch                " highlight search
set incsearch               " incremental search
set expandtab               " converts tabs to white space
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (needs a language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
