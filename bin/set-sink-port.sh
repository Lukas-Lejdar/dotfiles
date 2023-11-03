#!/bin/bash
#
#Read the argument values based on the options
while getopts "HS" var
do
   case "$var" in
       H) H="[Out] Headphones";;
       S) S="[Out] Speaker";;
   esac
done

SINK_NAME="alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink"

[ -z "$H" ] || /usr/bin/pactl set-sink-port "$SINK_NAME" "$H" 
[ -z "$S" ] || /usr/bin/pactl set-sink-port "$SINK_NAME" "$S"

/bin/bash $HOME/bin/bar.sh
