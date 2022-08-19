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

if has('mouse')
    set mouse=a
endif

"colorscheme desert

" highlight/diff color
hi Search     ctermfg=0
hi DiffAdd    ctermfg=233 ctermbg=194
hi DiffChange ctermfg=231 ctermbg=239
hi DiffText   ctermfg=233 ctermbg=189
hi DiffDelete ctermfg=252 ctermbg=224
hi Folded     ctermfg=233 ctermbg=248

autocmd FileType python,c,cpp setlocal et sta ts=4 sts=4 sw=4

let mapleader=","
map<silent><leader>ss :source $MYVIMRC<cr>
map<silent><leader>ee :e $MYVIMRC<cr>
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END
