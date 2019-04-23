# vim: set ft=sh :
set fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set PATH /Library/Developer/CommandLineTools/usr/bin $PATH
set PATH ~/miniconda3/bin $PATH
set PATH ~/.cargo/bin $PATH
# set PATH ~/go/bin $PATH
set PATH ~/.local/bin $PATH
set PATH . $PATH

# rust
#set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
#set -x CARGO_HOME ~/.cargo

alias rm trash
alias rrm /bin/rm
alias vim /Applications/MacVim.app/Contents/MacOS/Vim
alias emacs "/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emx "env TERM=xterm-24bits /Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias pc "proxychains4 -q"
alias pp "env ALL_PROXY=socks5://localhost:1086"

# homebrew
set -x HOMEBREW_NO_EMOJI 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_CASK_OPTS --appdir=/Applications
set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
#set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles

# powerline
powerline-daemon -q
set fish_function_path $fish_function_path ~/miniconda3/lib/python3.6/site-packages/powerline/bindings/fish
powerline-setup

# conda
. ~/miniconda3/etc/fish/conf.d/conda.fish

# iterm2
. ~/.iterm2_shell_integration.fish
