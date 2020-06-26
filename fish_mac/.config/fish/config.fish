# vim: set ft=sh :
set fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -u fish_user_paths \
	~/.local/bin \
	~/.cargo/bin \
	/usr/local/bin \
	~/.gem/ruby/2.6.0/bin \
	$fish_user_paths

# rust
set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup

alias rm trash
alias rrm /bin/rm
#alias vim /Applications/MacVim.app/Contents/MacOS/Vim
alias emacs "/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emx "env TERM=xterm-24bits /Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias pc "proxychains4 -q"
alias pp "env ALL_PROXY=socks5://localhost:1086"

# homebrew
set -x HOMEBREW_NO_EMOJI 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_CASK_OPTS --appdir=/Applications
set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# iterm2
. ~/.iterm2_shell_integration.fish

# pyenv init
pyenv init - | source
pyenv virtualenv-init - | source
