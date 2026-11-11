#!/usr/bin/env bash

CURRENT_MONITOR=$(hyprctl activeworkspace -j | jq -r ".monitor")
MONITORS=($(hyprctl monitors -j | jq -r '.[] | select(.disabled==false) | .name'))
[ "${#MONITORS[@]}" -le 1 ] && exit 0

for i in "${!MONITORS[@]}"; do
    if [ "${MONITORS[$i]}" = "$CURRENT_MONITOR" ]; then
        CURRENT_INDEX=$i
        break
    fi
done

NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#MONITORS[@]} ))
NEXT_MONITOR=${MONITORS[$NEXT_INDEX]}

hyprctl dispatch movecurrentworkspacetomonitor "$NEXT_MONITOR"
hyprctl dispatch movewindow mon:"$NEXT_MONITOR"
