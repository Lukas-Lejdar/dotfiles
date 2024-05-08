#!/bin/bash

kill-line() {
  BUFFER=""
}

cd_with_fzf() {
    local selected_file=$(fdfind -t d -H | eval fzf $FZF_CTRL_T_OPTS)
    if [ -n "$selected_file" ]; then
        BUFFER="cd $selected_file"
        zle accept-line
    fi
    zle reset-prompt
}

search_home_with_fzf() {
    local selected_file=$( fdfind . $HOME/ -H | \
      eval fzf --height=19 \
      --layout reverse \
      $FZF_CTRL_T_OPTS \
    )

    if [ -n "$selected_file" ]; then
        LBUFFER+=${selected_file}    
    fi
    zle reset-prompt
}

nvim_with_fzf() {
    zle -N cd_home
    bindkey ^h cd_home

    local selected_file=$(fdfind -H | eval fzf $FZF_CTRL_T_OPTS) 
    [ -z "$selected_file" ] && return

    if [ -f "$selected_file" ]; then
        BUFFER="nvim $selected_file"
        zle accept-line
    fi

    if [ -d $selected_file ]; then
        cd $selected_file
        BUFFER="nvim ."
        zle accept-line
    fi

    zle reset-prompt
}

cd_home() {
  overwrite_ctrl_u_dir $(pwd)
  BUFFER="cd $HOME"
  zle accept-line
}

cd_ctrl_u() {
  cd $CTRL_U_DIR
  zle accept-line
}

overwrite_ctrl_u_dir() {
  if ! [[ $1 -ef $HOME ]]; then
    export CTRL_U_DIR=$(pwd)
  fi
} 
