#!/bin/sh

eval $(/usr/bin/killall ssh-agent; /usr/bin/ssh-agent)

export WINIT_X11_SCALE_FACTOR=1.5 # for good alacritty fonr sizing
export _JAVA_AWT_WM_NONREPARENTING=1 # for BurpSuite window adjustment

setxkbmap -layout oh,cz -variant ,qwerty
xset r rate 200 50 &
/usr/bin/setxkbmap -option "caps:swapescape"

google-chrome &
feh --bg-scale $HOME/Pictures/Wallpapers/125254fc708bd9a722b4ef21ddf1ee88.jpg
picom --config ~/.config/picomp/picom.conf & 
systemctl --user import-environment DISPLAY XAUTHORITY &

#xset dpms 20 &
#xss-lock -- slock &dbus-update-activation-environment DISPLAY XAUTHORITY &

/bin/bash /home/lukas/bin/barloop.sh &

dwm > /home/lukas/.local/logs/dwm.log 2>&1
