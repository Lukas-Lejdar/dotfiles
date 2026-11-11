#!/bin/bash

source $HOME/bin/bar.sh

while true; do
  sleep 5 && $(updatebar)
done
