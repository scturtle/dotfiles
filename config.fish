# vim: set ft=sh :
# set LANG zh_CN.UTF-8
# fish_vi_mode

set PATH /Library/Developer/CommandLineTools/usr/bin/ $PATH
set PATH ~/miniconda3/bin $PATH

# GHC
set PATH /Applications/ghc-7.10.2.app/Contents/bin $PATH
set PATH ~/.cabal/bin $PATH
set PATH ~/.local/bin $PATH

set PATH . $PATH

alias rm trash
alias emax "emacsclient -t"

# homebrew
set HOMEBREW_NO_EMOJI 1
set EDITOR /usr/local/bin/vim
set HOMEBREW_CASK_OPTS --appdir=/Applications

# powerline
powerline-daemon -q
set fish_function_path $fish_function_path ~/miniconda3/lib/python3.5/site-packages/powerline/bindings/fish
powerline-setup

# conda
. ~/.config/fish/conda.fish
