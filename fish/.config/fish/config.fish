# vim: set ft=sh :
set fish_greeting

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x DISPLAY :0

set PATH ~/.cargo/bin $PATH
set PATH ~/.local/bin $PATH
set PATH . $PATH

alias emx "COLORTERM=truecolor emacs -nw"
alias pc "proxychains4 -q"
alias ss "sudo systemctl"
alias sj "sudo journalctl"

if status --is-login
  if not set -q TMUX; and tmux has-session 2>/dev/null; tmux attach; end;
end
