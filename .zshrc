# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rm="echo 'ERROR: please use trash'"
alias axel="axel -a"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# github golang cabal scala osx vi-mode vundle python zsh-syntax-highlighting history-substring-search)
plugins=(git brew golang zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# powerline
. ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# haskell
GHC_DOT_APP="/Applications/ghc-7.10.1.app"
export PATH=.:/usr/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/heroku/bin:$HOME/.cabal/bin:$GHC_DOT_APP/Contents/bin:/opt/X11/bin:/usr/texbin:$PATH

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# for theano
export DYLD_FALLBACK_LIBRARY_PATH="/Users/scturtle/anaconda/lib"
# auto-fu.zsh
#if [ -f ~/.config/zsh/auto-fu.zsh/auto-fu.zsh ]; then
#source ~/.config/zsh/auto-fu.zsh/auto-fu.zsh
    #zle-line-init () {auto-fu-init;}; zle -N zle-line-init
#fi

# predict
#autoload -U predict-on
#zle -N predict-on
#zle -N predict-off
#bindkey '^X1' predict-on
#bindkey '^X2' predict-off

# online helper
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
