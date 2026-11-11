#!/usr/bin/env bash

units=("KB" "MB" "GB")

# Function to convert bytes to human-readable units
function human_readable() {
    local size=$1
    local i=0
    while (( size >= 1024 && i < ${#units[@]}-1 )); do
        size=$(( size / 1024 ))
        ((i++))
    done
    echo "${size} ${units[i]}"
}

IFACE=$(ip route | awk '/default/ {print $5; exit}')

[[ -z "$IFACE" ]] && exit 1
[[ -f /sys/class/net/$IFACE/statistics/rx_bytes ]] || exit 1

RX_PREV=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX_PREV=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

sleep 1

RX_NOW=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX_NOW=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

RX_SPEED=$(( (RX_NOW - RX_PREV) / 1024 ))
TX_SPEED=$(( (TX_NOW - TX_PREV) / 1024 ))

RX_HR=$(human_readable $RX_SPEED)
TX_HR=$(human_readable $TX_SPEED)


echo "↑${TX_HR} ↓${RX_HR} "

