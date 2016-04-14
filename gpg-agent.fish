# from: https://github.com/kvs/dotfiles
# Assumes gpg-agent runs in background and
# writes its environment info in ~/.gpg-agent-info.

function __refresh_gpg_agent_info -d "Re-load ~/.gpg-agent-info into environment"
	cat ~/.gpg-agent-info | sed 's/=/ /' | while read key value
		set -e $key
		set -U -x $key "$value"
	end
end

if test -f ~/.gpg-agent-info
	__refresh_gpg_agent_info
	set -U -x GPG_TTY (tty)
end
