#!/bin/sh

eval $(/usr/bin/killall ssh-agent; /usr/bin/ssh-agent)

export WINIT_X11_SCALE_FACTOR=1.5 # alacritty font sizing
export _JAVA_AWT_WM_NONREPARENTING=1 # BurpSuite window adjustment

/usr/bin/xset r rate 200 50 &
/usr/bin/setxkbmap -layout oh,cz -variant ,qwerty
#/usr/bin/setxkbmap -option "caps:swapescape"
xmodmap -e "keycode 104="
xmodmap -e "keycode 109="
xmodmap -e "keycode 112="
xmodmap -e "keycode 117="

chromium-browser &
feh --bg-scale $HOME/Pictures/Wallpapers/125254fc708bd9a722b4ef21ddf1ee88.jpg
picom --config ~/.config/picomp/picom.conf & 
systemctl --user import-environment DISPLAY XAUTHORITY &

export TERM=xterm-256color
tmux start-server

#xset dpms 20 &
#xss-lock -- slock &dbus-update-activation-environment DISPLAY XAUTHORITY &

/bin/bash /home/lukas/bin/set-sink-port.sh -H &
/bin/bash /home/lukas/bin/barloop.sh &
/bin/bash /home/lukas/bin/low_battery.sh &

echo "Running"

dwm > /home/lukas/.local/logs/dwm.log 2>&1


