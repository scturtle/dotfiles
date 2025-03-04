set shell=/bin/bash " avoid problem in fish
set nocompatible
filetype off

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'farmergreg/vim-lastplace'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
"Plug 'rhysd/vim-llvm'
call plug#end()

filetype plugin indent on
syntax on

""set ruler " show line and row number on cursor
set showmatch " show matching bracket
set hidden "switching buffers without saving
set showcmd " display incomplete commands
set clipboard=unnamed,unnamedplus " use system clipboard
set backspace=indent,eol,start " backspacing in insert mode
"set cursorline " highlight current line
set scrolloff=6
set novisualbell
set autoread " reload files when changed on disk
set wildmenu " GREAT autocomplete menu
"set nomodeline
set noesckeys
set laststatus=2
set statusline=%y%m%r\ %<%F\ %=\ %l:%c\ \ %03P

" for search
set ignorecase " case-insensitive search
set smartcase " case-sensitive search if any caps
set incsearch " search as you type
set hlsearch
set magic

nnoremap gb :bn<cr>
nnoremap gB :bp<cr>

" mimic emacs
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-a> <Home>
inoremap <c-e> <End>
inoremap <c-d> <Del>
inoremap <c-h> <BS>
" cmdline-editing
cnoremap <c-g> <c-c>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-d> <Del>
execute "set <M-b>=\eb"
execute "set <M-f>=\ef"
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" disable cmdline history
map q: :

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

set termguicolors
"color catppuccin_mocha
color catppuccin_latte

"setlocal expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType python setlocal et sta ts=4 sts=4 sw=4
autocmd FileType rust,c,cpp setlocal et sta ts=2 sts=2 sw=2
autocmd FileType mlir setlocal nowrap

let mapleader=","
map<silent><leader>ss :source $MYVIMRC<cr>
map<silent><leader>ee :e $MYVIMRC<cr>
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END

" vim-oscyank
let g:oscyank_silent = 1
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankRegister "' | endif
