#!/bin/bash

/usr/bin/pactl set-sink-mute alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink toggle
 
bash $HOME/bin/bar.sh
