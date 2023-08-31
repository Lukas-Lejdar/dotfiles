#!/bin/sh

eval $(/usr/bin/killall ssh-agent; /usr/bin/ssh-agent)

WINIT_X11_SCALE_FACTOR=1.5

setxkbmap -option 'grp:win_space_toggle' -layout us,cz -variant ,qwerty
xset r rate 200 50 &

google-chrome &
feh --bg-scale $HOME/Pictures/Wallpapers/125254fc708bd9a722b4ef21ddf1ee88.jpg
picom --config ~/.config/picomp/picom.conf & 
systemctl --user import-environment DISPLAY XAUTHORITY &
#dbus-update-activation-environment DISPLAY XAUTHORITY &

/bin/bash /home/lukas/bin/bar.sh &

dwm > /home/lukas/.local/logs/dwm.log 2>&1
