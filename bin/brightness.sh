#!/bin/bash

#Read the argument values based on the options
while getopts "i:D:s:r" var
do
   case "$var" in
       i) inc="-i ${OPTARG}";;
       D) display="-D ${OPTARG}";;
       s) set="-s ${OPTARG}";;
       r) set="-r ${OPTARG}";;
   esac
done

echo $r
echo $inc

/usr/bin/python3 /home/lukas/bin/brightness.py $inc $display $set $r
