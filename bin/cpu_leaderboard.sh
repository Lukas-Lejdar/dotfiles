#!/bin/bash

DURATION=${1:-10}

echo "Measuring CPU usage for $DURATION seconds..."

pidstat -u 1 $DURATION \
    | awk '/^[0-9]/ {cpu[$4]+=$8} END {for(p in cpu) printf "%-25s %.2f%%\n", p, cpu[p]}' \
    | sort -k2 -nr \
    | head -20

