# vim: set ft=sh :
set -g fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

fish_add_path -m /usr/local/bin
fish_add_path -m ~/.cargo/bin
fish_add_path -m ~/.local/bin

# rust
set -x CARGO_UNSTABLE_SPARSE_REGISTRY true

alias rm trash
alias rrm /bin/rm
alias emx "COLORTERM=truecolor emacs -nw"
alias pc "proxychains4 -q"
alias pp "https_proxy=http://127.0.0.1:1087 http_proxy=http://127.0.0.1:1087 all_proxy=socks5://127.0.0.1:1087"
alias yp "you-get -p /Applications/IINA.app/Contents/MacOS/iina-cli"
alias docker podman

# homebrew
set -x HOMEBREW_NO_EMOJI 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_CASK_OPTS --appdir=/Applications

# pyenv init
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
