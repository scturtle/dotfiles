set nocompatible
filetype plugin indent on
syntax on

"set ruler " show line and row number on cursor
set showmatch " show matching bracket
set hidden "switching buffers without saving
set showcmd " display incomplete commands
set clipboard=unnamed " use system clipboard
set backspace=indent,eol,start " backspacing in insert mode
set cursorline " highlight current line
set scrolloff=6
set visualbell
set autoread " reload files when changed on disk
set wildmenu " GREAT autocomplete menu

" for search
set ignorecase " case-insensitive search
set smartcase " case-sensitive search if any caps
set incsearch " search as you type
set hlsearch
set magic

" mimic emacs
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-a> <Home>
inoremap <c-e> <End>
inoremap <c-d> <Del>
inoremap <c-h> <BS>
" cmdline-editing
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-d> <Del>

" indent
set autoindent
set cindent

" no template files
set nobackup
set nowritebackup
set noswapfile

" persistent undo
set undofile
set undodir=~/.undo
set history=10000

" encoding
if has("multi_byte")
  "set encoding=utf-8
  set termencoding=utf-8
  set fileencodings=utf-8,chinese,latin-1
endif

"colorscheme desert
autocmd FileType python,c,cpp setlocal et sta ts=4 sts=4 sw=4

let mapleader=","
map<silent><leader>ss :source ~/.vimrc<cr>
map<silent><leader>ee :e ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc
