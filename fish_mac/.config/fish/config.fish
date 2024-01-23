# vim: set ft=sh :
set fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

fish_add_path -m /opt/homebrew/bin
fish_add_path -m /usr/local/bin
fish_add_path -m ~/.cargo/bin
fish_add_path -m ~/.local/bin

alias rm trash
alias rrm /bin/rm
alias emx "COLORTERM=truecolor TERM=xterm-kitty emacs -nw"
alias pc "proxychains4 -q"
alias pp "env ALL_PROXY=socks5://127.0.0.1:1086"
alias docker podman

# homebrew
set -x HOMEBREW_NO_EMOJI 1
set -x HOMEBREW_CASK_OPTS --appdir=/Applications
