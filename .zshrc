# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZLE_RPROMPT_INDENT=0
ZSH_THEME="powerlevel10k/powerlevel10k"
autoload -U colors && colors	# Load colors
setopt autocd

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TEXMFHOME=~/texmf
PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"

zstyle ':omz:update' mode auto      # update automatically without asking
source $ZSH/oh-my-zsh.sh
source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle pip
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

plugins=(chucknorris emotty )

source /home/lukas/.local/miniconda3/bin/activate tf
source /opt/fzf-tab-completion/zsh/fzf-zsh-completion.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)
alias tlmgr=/usr/local/texlive/2023/bin/x86_64-linux/tlmgr --usermode
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'

export FZF_DEFAULT_COMMAND="fdfind -H"
export FZF_CTRL_T_COMMAND="fdfind -H"
export FZF_ALT_C_COMMAND="fdfind . $HOME -t d -H"

export FZF_CTRL_T_OPTS="--ansi --preview-window 'hidden' --preview 'bat --color=always --style=header,grid --line-range :300 {}' --bind 'ctrl-space:change-preview-window(up|right:60%|)'"

export CTRL_U_DIR="/"

# ------------------ SHORTCUTS ------------------
zle -N cd_with_fzf
bindkey ^f cd_with_fzf

zle -N search_home_with_fzf
bindkey ^b search_home_with_fzf

zle -N open_with_fzf
bindkey ^o open_with_fzf

zle -N nvim_with_fzf
bindkey ^v nvim_with_fzf

zle -N nvim_dir_with_fzf
bindkey '^[v' nvim_dir_with_fzf

zle -N cd_home
bindkey ^h cd_home

zle -N cd_ctrl_u
bindkey ^u cd_ctrl_u

# ------------------ FUNCTIONS ------------------
cd_with_fzf() {
    local selected_file=$(fdfind -t d -H | eval fzf $FZF_CTRL_T_OPTS) 
    if [ -n "$selected_file" ]; then
        BUFFER="cd $selected_file"
        zle accept-line
    fi
    zle reset-prompt
}

search_home_with_fzf() {
    local selected_file=$(fdfind . $HOME/ -H | eval fzf $FZF_CTRL_T_OPTS) 
    if [ -n "$selected_file" ]; then
        LBUFFER+=${selected_file}    
    fi
    zle reset-prompt
}

open_with_fzf() {
    fdfind -t f -H -I | fzf -m --preview="xdg-mime query filetype {} | xargs -I {} xdg-mime query default {}" --preview-window 'down:5%' --bind 'ctrl-space:change-preview-window(hidden|)' | xargs -ro -d "\n" xdg-open 2>&-
}

nvim_with_fzf() {
    local selected_file=$(fdfind -H | eval fzf $FZF_CTRL_T_OPTS) 
    if [ -n "$selected_file" ]; then
        BUFFER="nvim $selected_file"
        zle accept-line
    fi
    zle reset-prompt
}

nvim_dir_with_fzf() {
    local selected_file=$(fdfind -H -t d | eval fzf $FZF_CTRL_T_OPTS) 
    if [ -n "$selected_file" ]; then
        BUFFER="nvim $selected_file"
        zle accept-line
    fi
    zle reset-prompt
}

cd_home() {
  overwrite_ctrl_u_dir $(pwd)
  cd $HOME
  zle accept-line
}

cd_ctrl_u() {
  cd $CTRL_U_DIR
  zle accept-line
}

#echo_ctrl_u() {
#  printf "\n$CTRL_U_DIR"
#}

overwrite_ctrl_u_dir() {
  if ! [[ $1 -ef $HOME ]]; then
    export CTRL_U_DIR=$(pwd)
  fi
} 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lukas/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lukas/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lukas/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lukas/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# <<< conda initialize <<<

PATH="/home/lukas/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/lukas/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/lukas/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/lukas/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/lukas/perl5"; export PERL_MM_OPT;
