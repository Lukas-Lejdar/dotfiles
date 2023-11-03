#!/bin/bash

[[ $1 == "cz" ]] && /usr/local/bin/xkblayout-state set 1
[[ $1 == "us" ]] && /usr/local/bin/xkblayout-state set 0
[[ $1 == ""  ]] && /usr/local/bin/xkblayout-state set +1

/bin/bash $HOME/bin/bar.sh
