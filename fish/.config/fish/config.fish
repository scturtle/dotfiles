# vim: set ft=sh :
set fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x DISPLAY :0

set PATH ~/.cargo/bin $PATH
set PATH ~/.local/bin $PATH
set PATH /home/linuxbrew/.linuxbrew/bin $PATH
set PATH . $PATH

alias ema "env LC_ALL=zh_CN.UTF-8 emacs"
alias emx "emacs -nw"
alias emc "emacsclient -t"
alias pc proxychains4
alias pp "env ALL_PROXY=socks5://localhost:1086"
alias ss "sudo systemctl"
alias sj "sudo journalctl"

# pyenv init
status --is-interactive; and source (pyenv init -|psub)
