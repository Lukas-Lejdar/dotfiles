echo "we are in zprofile"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#Startx Automatically
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then 
  exec startx &>/dev/null 
fi
