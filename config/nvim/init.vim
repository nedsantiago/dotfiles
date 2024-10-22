" MY CONFIG SETTINGS

" KEY REMAPPING

" Parenthesis completion
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
inoremap """  """"""<Esc>hhha

inoremap {<CR> {<CR><BS>}<Esc>ko
inoremap (<CR> (<CR><BS>)<Esc>ko
inoremap [<CR> [<CR><BS>]<Esc>ko
inoremap "<CR> "<CR><BS>"<Esc>ko
inoremap '<CR> '<CR><BS>'<Esc>ko
inoremap """<CR> """<CR>"""<Esc>ko

inoremap {} {} <Esc>ha
inoremap () () <Esc>ha
inoremap [] [] <Esc>ha
inoremap "" "" <Esc>ha
inoremap '' '' <Esc>ha
inoremap `` `` <Esc>ha
inoremap """" """"""<Esc>hhha

" Copied from Neural Nine
let indent=4
set number                  " add line numbers
set relativenumber          " Relative Numbers
set autoindent              " indent a new line to align with line just typed
let &tabstop=indent               " number of columns occupied by a tab
let &shiftwidth=indent            " width for autoindents
let &softtabstop=indent           " see multiple spaces as tabstops
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
" set foldmethod=indent


" PLUGINS

call plug#begin()

Plug 'norcalli/nvim-colorizer.lua'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()


" Configure Language Server
if executable('pylsp')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'pylsp',
      \ 'cmd': {server_info->['pylsp']},
      \ 'whitelist': ['python'],
      \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
