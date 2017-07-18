PS1='\[\033[0;32m\]$PWD\[\033[0m\]
\[\033[0;33m\]\$\[\033[0m\] '

alias ls='ls -Gh'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias rm='trash'

# basicTex
#export PATH="/usr/local/texlive/2016basic/bin/universal-darwin:$PATH"

# Miniconda3
export PATH="~/miniconda3/bin:$PATH"

export PATH="~/.local/bin:$PATH"

# rust
export PATH=~/.cargo/bin:$PATH
export RUST_SRC_PATH=~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src
export CARGO_HOME=~/.cargo

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
