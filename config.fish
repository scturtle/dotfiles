# vim: set ft=sh :

set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH ~/miniconda3/bin $PATH

# GHC
set PATH /Applications/ghc-7.10.1.app/Contents/bin $PATH
set PATH ~/.cabal/bin $PATH
set PATH .cabal-sandbox/bin $PATH

set PATH . $PATH

alias rm trash
alias emax "emacsclient -t"

alias ghc-sandbox "ghc -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias ghci-sandbox "ghci -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias runhaskell-sandbox "runhaskell -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"

# homebrew
set HOMEBREW_NO_EMOJI 1
set EDITOR /usr/local/bin/vim
set HOMEBREW_CASK_OPTS --appdir=/Applications

# powerline
powerline-daemon -q
set fish_function_path $fish_function_path ~/miniconda3/lib/python3.4/site-packages/powerline/bindings/fish
powerline-setup

