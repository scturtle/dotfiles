# vim: set ft=sh :
set fish_greeting

function fish_prompt
  echo -s (set_color ccc) (hostname) ' ' (set_color green) (prompt_pwd) (set_color normal) '> '
end

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8

set PATH ~/.cargo/bin $PATH
set PATH ~/.local/bin $PATH
set PATH . $PATH

# rust
#set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
#set -x CARGO_HOME ~/.cargo

alias ema "env LC_ALL=zh_CN.UTF-8 emacs"
alias emx "env TERM=xterm-24bits emacs -nw"
alias pc proxychains4
alias pp "env ALL_PROXY=socks5://localhost:1086"
alias brew /home/linuxbrew/.linuxbrew/bin/brew
alias ss "sudo systemctl"
alias sj "sudo journalctl"

source ~/miniconda3/etc/fish/conf.d/conda.fish
