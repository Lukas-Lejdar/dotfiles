#!/bin/bash

source $HOME/bin/bar.sh

while true; do
  sleep 1 && $(updatebar)
done
