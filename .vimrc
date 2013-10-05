" configure vundle
set shell=/bin/bash " avoid problem in fish

filetype off
filetype plugin indent off
set runtimepath+=/usr/local/Cellar/go/1.2rc1/libexec/misc/vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Align'
"Bundle 'dag/vim2hs'
Bundle 'davidhalter/jedi-vim'
Bundle 'EasyMotion'
" EasyMotion trigger:<leader><leader>[fFwb]
"Bundle 'jcf/vim-latex'
Bundle 'nanotech/jellybeans.vim'
"Bundle 'LanguageTool'
Bundle 'scrooloose/nerdtree'
"Bundle 'sjl/gundo.vim'
Bundle 'SuperTab-continued.'
Bundle 'The-NERD-Commenter'
Bundle 'nvie/vim-flake8'
Bundle 'derekwyatt/vim-scala'
"Bundle 'ZenCoding.vim'

""""""""
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
""""""""

""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
set nocompatible " be iMproved

set ruler " show line and row number on cursor
set showmatch " show matching bracket
set hidden "switching buffers without saving
set showcmd " display incomplete commands
set clipboard=unnamed " use system clipboard
set backspace=indent,eol,start " backspacing in insert mode
set cursorline
set scrolloff=6
"set relativenumber
set visualbell
set autoread " reload files when changed on disk

" for search
set ignorecase " case-insensitive search
set smartcase " case-sensitive search if any caps
set incsearch " search as you type
set hlsearch
set magic

" indent
set autoindent
set smartindent

" no template files
set nobackup
set nowritebackup
set noswapfile

" persistent undo
set undofile
if has('unix')
  set undodir=~/.vimundo
else
  set undodir=d:/vimundo
endif
set history=500

" encoding
if has("multi_byte")
  set encoding=utf-8
  set termencoding=utf-8
  set fileencodings=utf-8,chinese,latin-1
endif

" menu encoding
source $VIMRUNTIME/delmenu.vim
if has("unix")
  set langmenu=zh_CN.UTF-8
else
  set langmenu=en_US
endif
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

if has("gui_running")
  colorscheme smyck
else
  colorscheme jellybeans
end

if has("gui_running")
  if has("win32")
    set guifont=Source_Code_Pro_for_Powerline:h14:cANSI
    set guifontwide=Microsoft_YaHei:h14
  endif
  if has('mac')
      set go=aAce
      set transparency=10
      "set guifont=Source\ Code\ Pro\ For\ Powerline:h16
      set guifont=Monaco\ For\ Powerline:h16
  endif
  if has("unix") && !has('mac')
      "Linux options here
  endif
endif

" indent
"setlocal expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4 
autocmd FileType python,haskell,go,c,cpp setlocal et sta ts=4 sts=4 sw=4
autocmd FileType html,htmldjango,matlab,vim,tex setlocal et sta ts=2 sts=2 sw=2

autocmd FileType go setlocal makeprg=go\ run\ %
autocmd FileType python setlocal makeprg=python\ %
autocmd FileType haskell setlocal makeprg=runhaskell\ %
autocmd FileType c setlocal makeprg=gcc\ -Wall\ -g\ %\ -o\ %<
autocmd FileType cpp setlocal makeprg=g++\ -Wall\ -g\ %\ -o\ %<

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
"nnoremap ,u :GundoToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set noshowmode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" jedi-vim
" goto:<leader>g  defn:<leader>d  doc:K  rename:<leader>r  related:<leader>n
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType python map <buffer> <F7> :call Flake8()<CR>
let g:flake8_builtins="_,apply"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype plugin on
""set shellslash  " conflict with vundle
"set grepprg=grep\ -nH\ $*
"filetype indent on
"let g:Tex_Leader=','  " I use this
"let g:tex_flavor='latex'
"let g:Tex_DefaultTargetFormat = 'pdf'
"set runtimepath+=/Applications/Skim.app/Contents/MacOS/
"let g:Tex_ViewRule_pdf = 'Skim'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=-1 -src-specials -interaction=nonstopmode $*'
"let g:Tex_MultipleCompileFormats = 'pdf, aux'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim2hs
let g:haskell_conceal = 1
let g:haskell_conceal_wide = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
