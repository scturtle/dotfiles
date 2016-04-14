PS1='\[\033[0;32m\]$PWD\[\033[0m\]
\[\033[0;33m\]\$\[\033[0m\] '

alias ls='ls -Gh'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias rm='trash'
alias emax='emacsclient -t'

# fix cabal-helper
export PATH=`printf '%s' ~/.stack/programs/*/ghc-*/bin/`:$PATH
# xcode-select --install
export PATH=/Library/Developer/CommandLineTools/usr/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=~/miniconda3/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=.:$PATH

# iterm2
source ${HOME}/.iterm2_shell_integration.bash

# gpg-agent
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export GPG_TTY=$(tty)
fi
