# vim: set ft=sh :
set -g fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

fish_add_path -m /usr/local/bin
fish_add_path -m ~/.cargo/bin
fish_add_path -m ~/.local/bin

# rust
#-set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
#set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static

alias rm trash
alias rrm /bin/rm
#alias vim /Applications/MacVim.app/Contents/MacOS/Vim
alias emacs "/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emx "env TERM=xterm-24bits /Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias pc "proxychains4 -q"
alias pp "env ALL_PROXY=socks5://localhost:1086"
alias yp "you-get -p /Applications/IINA.app/Contents/MacOS/iina-cli"

set -x EMACS /Applications/Emacs.app/Contents/MacOS/Emacs

# homebrew
set -x HOMEBREW_NO_EMOJI 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_CASK_OPTS --appdir=/Applications
#set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.aliyun.com/homebrew/homebrew-bottles
#set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# iterm2
. ~/.iterm2_shell_integration.fish

# pyenv init
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
