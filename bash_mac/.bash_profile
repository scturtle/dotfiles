alias ls='ls -Gh'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias rm='trash'

# basicTex
export PATH="/usr/local/texlive/2016basic/bin/universal-darwin:$PATH"

# Miniconda3
export PATH="~/miniconda3/bin:$PATH"

# rust
export PATH="~/.cargo/bin:$PATH"
export RUST_SRC_PATH=~/.cargo/rustc-src/src
export CARGO_HOME=~/.cargo

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
