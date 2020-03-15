PS1='\[\033[0;32m\]$PWD\[\033[0m\]
\[\033[0;33m\]\$\[\033[0m\] '

alias ls='ls -Gh'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias rm='trash'

# basicTex
#export PATH="/usr/local/texlive/2016basic/bin/universal-darwin:$PATH"

export PATH="~/.local/bin:$PATH"

# rust
export PATH=~/.cargo/bin:$PATH
export RUST_SRC_PATH=~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src
export CARGO_HOME=~/.cargo

export PATH=~/go/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/scturtle/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/scturtle/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/scturtle/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/scturtle/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

