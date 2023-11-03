#!/bin/bash

#Read the argument values based on the options
while getopts "i:r" var
do
   case "$var" in
       i) inc="${OPTARG}";;
   esac
done

/usr/bin/pactl set-sink-mute alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink 0
OUT=`{ amixer sget Headphone; amixer sget Speaker; } | tr "\n" "\n" | awk '/Simple/ {control = substr($0,index($0,$4))} /\[on\]/ {print control; exit;}'`

/usr/bin/amixer -q sset $OUT $inc
bash $HOME/bin/bar.sh

