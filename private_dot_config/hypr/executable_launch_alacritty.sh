#!/bin/bash

# Check if the argument is "tmux" or not
if [ "$1" == "tmux" ]; then
    # Launch Alacritty with Tmux
    alacritty --command /usr/bin/fish -l -c "tmux new-session -A"
else
    # Launch Alacritty without Tmux
    alacritty --command /usr/bin/fish -l
fi
