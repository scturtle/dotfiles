# vim: set ft=sh :
# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

#set GOPATH ~/golib
#set GOROOT (go env | grep GOROOT |cut -d '"' -f2)

set PATH . $PATH
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH ~/.cabal/bin $PATH
set PATH /usr/local/heroku/bin $PATH
set PATH /usr/texbin $PATH
set HOMEBREW_NO_EMOJI 1
set EDITOR /usr/local/bin/vim
#set fish_greeting ""

alias rm trash

# Theme
#set fish_theme agnoster
set fish_theme numist

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins brew python autojump emoji-clock

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish cofiguration.
. $fish_path/oh-my-fish.fish
