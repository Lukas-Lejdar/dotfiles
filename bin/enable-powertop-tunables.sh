#!/bin/bash

# enable all suggestions from powertop
echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs'
echo '0' > '/proc/sys/kernel/nmi_watchdog'
#echo 'auto' > '/sys/bus/usb/devices/3-3/power/control' #auto suspention of mouse
echo 'auto' > '/sys/bus/pci/devices/0000:05:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:0a.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:04:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:14.2/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:07:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.5/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:14.3/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:04.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.0/power/control'
