set shell=/bin/bash " avoid problem in fish

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'nanotech/jellybeans.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'dracula/vim'
Plug 'vim-scripts/DoxyGen-Syntax' " for megvii

" for python
"Plug 'davidhalter/jedi-vim'
"Plug 'andviro/flake8-vim'

call plug#end()

filetype plugin indent on
syntax on

"set ruler " show line and row number on cursor
set showmatch " show matching bracket
set hidden "switching buffers without saving
set showcmd " display incomplete commands
if has("macunix")
  set clipboard=unnamed " use system clipboard
else
  set clipboard=unnamedplus " use system clipboard
endif
set backspace=indent,eol,start " backspacing in insert mode
set cursorline " highlight current line
set scrolloff=6
set novisualbell
set autoread " reload files when changed on disk
set wildmenu " GREAT autocomplete menu
set nomodeline " for megvii

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

"set background=dark
"colorscheme jellybeans
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

set termguicolors
color dracula

if has("macunix")
  set go=aAce
  if has("gui_running")
      set transparency=2
  endif
endif

set guifont=Source\ Code\ Pro:h16

" indent
"setlocal expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4
let g:pymode_python = 'python3'
autocmd FileType python,haskell,c,cpp setlocal et sta ts=4 sts=4 sw=4
autocmd FileType html,javascript,cmake setlocal et sta ts=2 sts=2 sw=2

"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map<silent><leader>ss :source $MYVIMRC<cr>
map<silent><leader>ee :e $MYVIMRC<cr>
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
nnoremap gb :bn<cr>
nnoremap gB :bp<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
set laststatus=2 " /N
set noshowmode
set linespace&
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = [ 'indent' ]
"let g:airline_theme = 'bubblegum'
let g:airline_theme = 'deus'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" jedi-vim
" goto:<leader>g  defn:<leader>d  doc:K  rename:<leader>r  related:<leader>n
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" flake8-vim
autocmd FileType python map <buffer> <F7> :PyFlake<CR>
let g:PyFlakeOnWrite = 0
let g:PyFlakeDisabledMessages = 'E226'
" let g:PyFlakeRangeCommand = 'Q'
