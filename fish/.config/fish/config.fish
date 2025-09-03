# -*- mode: Shell-Script -*-
set fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x DISPLAY :0

set -gxp PATH ~/.cargo/bin
set -gxp PATH ~/.local/bin

alias emx "emacs -nw"
alias pc "proxychains4 -q"
alias pp "env ALL_PROXY=socks5://127.0.0.1:8000"
alias ss "sudo systemctl"
alias sj "sudo journalctl"

# plugins
if status -i && ! functions -q fisher
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
	fisher install jorgebucaran/fisher
	fisher install jethrokuan/z
	fisher install catppuccin/fish
	fish_config theme save "Catppuccin Mocha"
end

# for fd
set -x LS_COLORS

# if status --is-login
#   if not set -q TMUX; and tmux has-session 2>/dev/null; tmux attach; end;
