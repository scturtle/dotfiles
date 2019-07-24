# vim: set ft=sh :
set fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set PATH ~/.cargo/bin $PATH
set PATH ~/.local/bin $PATH
set PATH . $PATH

# rust
#set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
#set -x CARGO_HOME ~/.cargo

alias emx "env TERM=xterm-24bits emacs -nw"
alias pc proxychains4
alias pp "env ALL_PROXY=socks5://localhost:1086"
alias brew /home/linuxbrew/.linuxbrew/bin/brew

source ~/miniconda3/etc/fish/conf.d/conda.fish
