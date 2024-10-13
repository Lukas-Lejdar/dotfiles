#!/bin/bash

if [[ ! -f /home/lukas/.config/alacritty/themes/default.toml ]]; then
    export USE_LIGHT="true"
    /usr/bin/ln -s /home/lukas/.config/alacritty/themes/themes/papertheme.toml /home/lukas/.config/alacritty/themes/default.toml
else
    unset USE_LIGHT
    rm  /home/lukas/.config/alacritty/themes/default.toml
fi

tmux source-file ~/.config/tmux/tmux.conf
echo "" >> /home/lukas/.config/alacritty/alacritty.toml
