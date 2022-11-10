set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

if !(has('gui_running') || &termguicolors)
  echomsg 'termguicolors is required'
  finish
endif

let g:colors_name = "aura"

hi Normal guifg=#edecee guibg=#21202e
hi Cursor guifg=#6d6d6d guibg=#edecee
hi CursorLine guifg=NONE guibg=#1c1b27 gui=NONE cterm=NONE
hi CursorLineNr guifg=#edecee guibg=NONE gui=NONE cterm=NONE
hi! link CursorColumn CursorLine
hi! link ColorColumn CursorLine
hi LineNr guifg=#6d6d6d guibg=NONE
hi NonText guifg=#82e2ff guibg=NONE
" hi link EndOfBuffer NonText
hi ErrorMsg guifg=#ff6767 guibg=NONE
hi WarningMsg guifg=#ffca85 guibg=NONE

hi Visual guifg=#0f0f0f guibg=#a277ff
hi VisualNOS guifg=#0f0f0f guibg=#a277ff
hi Search guifg=#0f0f0f guibg=#a277ff
" hi link CurSearch Search
hi IncSearch guifg=#ffca85 guibg=#a277ff
hi MatchParen guifg=#edecee guibg=NONE
hi Folded guifg=#6d6d6d guibg=NONE
hi FoldColumn guifg=#61ffca guibg=#2d2d2d

hi StatusLine guifg=#2d2d2d guibg=#edecee
hi StatusLineNC guifg=#1c1b27 guibg=#edecee
hi VertSplit guifg=#1c1b27 guibg=NONE

hi Pmenu guifg=#edecee guibg=#2d2d2d
hi PmenuSel guifg=#edecee guibg=#a277ff
hi PmenuSbar guifg=#edecee guibg=#6d6d6d
hi PmenuThumb guifg=#6d6d6d guibg=#edecee
hi Underlined guifg=#61ffca guibg=NONE
hi WildMenu guifg=#edecee guibg=#a277ff

hi TabLine guifg=#edecee guibg=#1c1b27 gui=NONE cterm=NONE
hi TabLineFill guifg=#1c1b27 guibg=#edecee
hi TabLineSel guifg=#edecee guibg=#2d2d2d
hi Title guifg=#edecee guibg=NONE

hi Identifier guifg=#f694ff guibg=NONE
hi PreProc guifg=#82e2ff guibg=NONE
" hi link PreCondit PreProc
" hi link Define PreProc
hi Include guifg=#a277ff guibg=NONE
hi Comment guifg=#6d6d6d guibg=NONE
hi Constant guifg=#61ffca guibg=NONE
" hi link String Constant
" hi link Number Constant
hi Function guifg=#ffca85 guibg=NONE
hi Statement guifg=#a277ff guibg=NONE
" hi link Label Statement
hi Type guifg=#ffca85 guibg=NONE
" hi link StorageClass Type
" hi link Structure Type
" hi link Typedef Type
hi Todo guifg=#6d6d6d guibg=#ffca85
hi Error guifg=#6d6d6d guibg=#ff6767
hi Special guifg=#a277ff guibg=NONE
hi SpecialKey guifg=#a277ff guibg=NONE

hi DiffAdd guifg=#6d6d6d guibg=#bdff98
hi DiffChange guifg=#6d6d6d guibg=#ffe0b8
hi DiffDelete guifg=#6d6d6d guibg=#ff9a9a
hi DiffText guifg=#edecee guibg=#6d6d6d
