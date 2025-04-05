# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end
#
# # Function to check the status of Tmux sessions
# function check_tmux
#     # Get the list of tmux sessions
#     set sessions (tmux list-sessions 2>/dev/null)
if status is-interactive

  fastfetch -l arch3
  oh-my-posh init fish --config ~/.config/ohmyposh/easy-term.json | source
end

# Created by `pipx` on 2024-01-14 00:32:42
set PATH $PATH /home/guillaume/.local/bin

set PATH $PATH:/usr/local/texlive/2023/bin/x86_64-linux
set EDITOR "nvim"
set XDG_CONFIG_HOME "~/.config"
alias gt="git status"
fish_config theme choose "Rosé Pine"

if [ "$TERM" = "linux" ]; then
	/bin/echo -e "
	\e]P0#191724
	\e]P1#eb6f92
	\e]P2#9ccfd8
	\e]P3#f6c177
	\e]P4#31748f
	\e]P5#c4a7e7
	\e]P6#ebbcba
	\e]P7#e0def4
	\e]P8#26233a
	\e]P9#eb6f92
	\e]PA#9ccfd8
	\e]PB#f6c177
	\e]PC#31748f
	\e]PD#c4a7e7
	\e]PE#ebbcba
	\e]PF#e0def4
	"
	# get rid of artifacts
	clear
end

thefuck --alias | source
zoxide init fish | source
fish_vi_key_bindings
