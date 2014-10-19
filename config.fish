# vim: set ft=sh :
# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

set PATH . $PATH
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH /usr/local/heroku/bin $PATH
set PATH /usr/texbin $PATH
set PATH ~/anaconda/bin $PATH
set PATH ~/.local/bin $PATH
set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

set HOMEBREW_NO_EMOJI 1
set EDITOR /usr/local/bin/vim
set HOMEBREW_CASK_OPTS --appdir=/Applications
#set fish_greeting ""

alias rm trash

# GHC
set PATH ~/.cabal/bin $PATH
set PATH .cabal-sandbox/bin $PATH
set PATH /Applications/ghc-7.8.3.app/Contents/bin $PATH
alias ghc-sandbox "ghc -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias ghci-sandbox "ghci -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias runhaskell-sandbox "runhaskell -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"

# Theme
#set fish_theme agnoster
#set fish_theme numist

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins brew python autojump

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish cofiguration.
. $fish_path/oh-my-fish.fish

# powerline
set fish_function_path $fish_function_path "~/.local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup
