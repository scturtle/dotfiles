set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"let $TMP="c:/Windows/Temp/"
set diffexpr= 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configure vundle
set nocompatible
filetype off
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin("$HOME/vimfiles/bundle/")

Plugin 'gmarik/Vundle.vim'
"Plugin 'Align'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'cscope.vim'
Plugin 'dag/vim2hs'
Plugin 'davidhalter/jedi-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'EasyMotion'
" EasyMotion trigger:<leader><leader>[fFwb]
Plugin 'jcf/vim-latex'
Plugin 'LanguageTool'
"Plugin 'scrooloose/nerdtree'
"Plugin 'sjl/gundo.vim'
Plugin 'SuperTab-continued.'
Plugin 'taglist.vim'
Plugin 'The-NERD-Commenter'
Plugin 'nanotech/jellybeans.vim'
Plugin 'andviro/flake8-vim'
Plugin 'koron/minimap-vim'

call vundle#end()
filetype plugin indent on
syntax on

"set ruler " show line and row number on cursor
set showmatch " show matching bracket
set hidden "switching buffers without saving
set showcmd " display incomplete commands
set clipboard=unnamed " use system clipboard
set backspace=indent,eol,start " backspacing in insert mode
set scrolloff=6
set cursorline
"set relativenumber
set visualbell
set autoread " reload files when changed on disk

"set list " show trailing whitespace

" for search
set ignorecase " case-insensitive search
set smartcase " case-sensitive search if any caps
set incsearch " search as you type
set hlsearch
set magic

" indent
set autoindent
set smartindent
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

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

"colorscheme smyck
"colorscheme base16-tomorrow
colorscheme jellybeans
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
autocmd FileType go setlocal noexpandtab ts=4 sts=4 sw=4 nolist
autocmd FileType python,haskell,c,cpp setlocal et sta ts=4 sts=4 sw=4
autocmd FileType html,htmldjango,matlab,vim,tex setlocal et sta ts=2 sts=2 sw=2

autocmd FileType go setlocal makeprg=go\ run\ %
autocmd FileType python setlocal makeprg=python\ %
autocmd FileType haskell setlocal makeprg=runhaskell\ %
autocmd FileType c setlocal makeprg=gcc\ -Wall\ -g\ %\ -o\ %<
autocmd FileType cpp setlocal makeprg=g++\ -Wall\ -g\ %\ -o\ %<

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map<silent><leader>ss :source ~/_vimrc<cr>
map<silent><leader>ee :e ~/_vimrc<cr>
autocmd! bufwritepost .vimrc source ~/_vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
nnoremap gb :bn<cr>
nnoremap gB :bp<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-airline
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = [ 'indent' ]
let g:airline_theme='powerlineish'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" jedi-vim
" goto:<leader>g  defn:<leader>d  doc:K  rename:<leader>r  related:<leader>n
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" snipmate
"let g:snips_trigger_key = "<F3>"
"let g:snippets_dir='$HOME/vimfiles/bundle/snipmate-snippets/snippets'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" supertab
let g:SuperTabDefaultCompletionType = "context"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LanguageTool
let g:languagetool_jar=$HOME . '\Documents\LanguageTool\LanguageTool.jar'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-latex
filetype plugin on
"set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
let g:Tex_Leader=','
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'SumatraPDF -reuse-instance -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=-1 -src-specials -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
"au BufWritePost *.tex exec 'silent! !'.g:Tex_CompileRule_pdf.' && pause'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim2hs
" WARNING: modified vim2hs\autoload\vim2hs\haskell\conceal.vim
let g:haskell_conceal = 0
"let g:haskell_conceal_wide = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" neco-ghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" flake8-vim
let g:PyFlakeOnWrite = 0
let g:PyFlakeDisabledMessages = 'E226'
let g:PyFlakeAggressive = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ctaglist
nmap <silent> <F9> :TlistToggle<cr>
"" cscope
nmap <silent> <F11> :CscopeGen .<cr><cr>
" in case your cscope execute is not in system path.
" let g:cscope_cmd = 'D:/tools/vim/cscope.exe'
" s: Find this C symbol
map <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
map <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
map <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
map <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
map <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
map <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
map <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
map <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
map <leader>l :call ToggleLocationList()<CR> 
