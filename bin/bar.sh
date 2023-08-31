#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.local/chadwm/bar_themes/onedark

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "CPU $cpu_val"
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
  printf "  $get_capacity"
}

brightness() {
  printf " %.0f" $(cat /sys/class/backlight/*/brightness)
}

mem() {
  printf "  "
  printf "$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "󰤨  Connected" ;;
	down) printf "󰤭  Disconnected" ;;
	esac
}

clock() {
	printf " 󱑆  $(date '+%H:%M') "
}

sound() {
  OFF=""
  HEADPHONE=`amixer sget Headphone | awk -F"[][]" '/dB/ { if ($6 == "on") print "󰋋 " $2; exit; }'`
  SPEAKER=`amixer sget Speaker | awk -F"[][]" '/dB/ { if ($6 == "on") print "󰓃 " $2; exit; }'`
  if [[ -z $HEADPHONE ]] && [[ -z $SPEAKER ]]; then
    OFF="󰖁 0%"
  fi
  echo $SPEAKER $HEADPHONE $OFF

}

layout() {
  echo "󰘵 " $(xkblayout-state print "%s" | sed 's/%//') 
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
  interval=$((interval + 1))

  sleep 1 && xsetroot -name " $(cpu)  |  $(mem)  |  $(layout)  |  $(sound)  |  $(battery)  |  $(wlan)  |  $(clock) "
done
