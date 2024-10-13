# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}


#setterm -linewrap off

export ZLE_RPROMPT_INDENT=0
#ZSH_THEME="gentoo"
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="amresh"
autoload -U colors && colors	# Load colors
setopt autocd

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TEXMFHOME="~/texmf"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64/"
export OPENSSL_CONF=/etc/ssl # for phatom js
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$(go env GOPATH)/bin:$PATH"
export SINK_NAME="alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink"
export PATH="$PATH:$HOME/.local/flutter/bin"
export PATH="$PATH:$HOME/.local/renderdoc_1.31/bin"
export PATH="$PATH:/usr/local/cuda/bin"
export PATH="$PATH:/usr/local/cuda/nvvm/bin"
export PATH="$PATH:/home/lukas/node_modules/.bin/"
export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda/"

export OPENCV_IO_ENABLE_OPENEXR=1

# Meshroom
export MESHROOM_ROOT="/home/lukas/.local/Meshroom/"
export PATH=$PATH:/home/lukas/.local/Meshroom-2023.3.0/aliceVision/bin/
export PYTHONPATH=$MESHROOM_ROOT:$PYTHONPATH

zstyle ':omz:update' mode auto      # update automatically without asking
source $ZSH/oh-my-zsh.sh
source $HOME/antigen.zsh
source "$HOME/bin/functions.sh"

antigen use oh-my-zsh
antigen bundle pip
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

plugins=(tmux)

#source /home/lukas/.local/miniconda3/bin/activate tf
source /opt/fzf-tab-completion/zsh/fzf-zsh-completion.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)
alias tlmgr=/usr/local/texlive/2023/bin/x86_64-linux/tlmgr --usermode
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
alias gdb='gdb -tui'
alias tisvpn="sudo openconnect vpn.tis-brno.cz:8443 --authgroup '[I-VPN_2FA]' -u lukas"
alias snvim='sudo -E -s nvim'
alias lf='lfrun'
alias fd='fdfind'

export FZF_DEFAULT_COMMAND="fdfind -H"
export FZF_CTRL_T_COMMAND="fdfind -H"

export FZF_CTRL_T_OPTS="--ansi --preview-window 'hidden' --preview 'bat --color=always --style=header,grid --line-range :300 {}' --bind 'ctrl-space:change-preview-window(up|right:60%|)'"

export CTRL_U_DIR="/"

# ------------------ SHORTCUTS ------------------

zle -N cd_home
zle -N kill-line

bindkey ^g cd_home
bindkey ^u cd_ctrl_u
bindkey ^k kill-line
bindkey ^n backward-kill-line 
bindkey ^h backward-kill-word # backspace and h 

alias ff="cd_find"
alias fv="find_vim"

cd_find() {
    local folder=$(fdfind -t d -H | eval fzf $FZF_CTRL_T_OPTS) 
    [ -z "$folder" ] && return
    cd $folder
}

find_vim() {
    local file=$(fdfind -H | eval fzf $FZF_CTRL_T_OPTS) 
    [ -z "$file" ] && return
    cd "$(dirname $file)"
    nvim "$(basename $file)"
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

# THEME
[ -f /home/lukas/.config/alacritty/themes/default.toml ] && export USE_LIGHT="true"

PATH="/home/lukas/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/lukas/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/lukas/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/lukas/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/lukas/perl5"; export PERL_MM_OPT;

export LF_ICONS="di=📁:\ "

bindkey '^[^H' backward-kill-word

#[ -z $TMUX ] && export TMUX="true" && echo "run" || echo "dont run"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
