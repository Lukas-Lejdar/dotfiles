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

/home/lukas/.local/miniconda3/envs/tf/bin/python3 /home/lukas/python/brightness.py $inc $display $set $r
