# vim: set ft=sh :
set fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -gxp PATH /opt/homebrew/bin
set -gxp PATH /usr/local/bin
set -gxp PATH ~/.cargo/bin
set -gxp PATH ~/.local/bin

alias emx "emacs -nw"
alias pp "env ALL_PROXY=socks5://127.0.0.1:1086"

# emacs lsp-mode
set -x LSP_USE_PLISTS 1

# homebrew
set -x HOMEBREW_NO_EMOJI 1
set -x HOMEBREW_CASK_OPTS --appdir=/Applications

# plugins
if status -i && ! functions -q fisher
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
	fisher install jorgebucaran/fisher
	fisher install jethrokuan/z
	fisher install catppuccin/fish
	fish_config theme save "Catppuccin Latte"
end
