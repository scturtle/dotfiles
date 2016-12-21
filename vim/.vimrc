set shell=/bin/bash " avoid problem in fish

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'CSApprox'
Plugin 'The-NERD-Commenter'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/syntastic'

" for haskell
Plugin 'dag/vim2hs'
"Plugin 'eagletmt/neco-ghc'
"Plugin 'eagletmt/ghcmod-vim'
"Plugin 'Shougo/vimproc.vim'

" unused
"Plugin 'davidhalter/jedi-vim'
"Plugin 'SuperTab--Van-Dewoestine'
"Plugin 'andviro/flake8-vim'
"Plugin 'Align'
" EasyMotion trigger:<leader><leader>[fFwb]
"Plugin 'EasyMotion'
" :NERDTree " q to quit
"Plugin 'scrooloose/nerdtree'
"Plugin 'sjl/gundo.vim'
"Plugin 'travitch/hasksyn'
"Plugin 'nbouscal/vim-stylish-haskell'

call vundle#end()

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

set background=dark
colorscheme jellybeans
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" for osx
set go=aAce
if has("gui_running")
    set transparency=10
endif

set guifont=Source\ Code\ Pro:h16

" indent
"setlocal expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4
let g:pymode_python = 'python3'
autocmd FileType python,haskell,c,cpp setlocal et sta ts=4 sts=4 sw=4
autocmd FileType html,javascript setlocal et sta ts=2 sts=2 sw=2

"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map<silent><leader>ss :source ~/.vimrc<cr>
map<silent><leader>ee :e ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc
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
let g:airline_theme = 'bubblegum'
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim2hs
let g:haskell_conceal = 0
"let g:haskell_conceal_wide = 1
