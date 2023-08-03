# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# The following lines were added by compinstall


zstyle ':completion:*' add-space true
zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 2
zstyle ':completion:*' condition 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' glob 2
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
# zstyle ':completion:*' matcher-list '+' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*' # commented out, too complex
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # simple case insensitive tab completion
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 3 not-numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' substitute 2
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/sven/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=9999
setopt autocd extendedglob notify
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_COMPLETION=true
export NVM_SYMLINK_CURRENT="true"
zinit wait lucid light-mode for lukechilds/zsh-nvm

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='git'

hash -d md=~/Documents/myDev
hash -d dc=/media/sven/Windows/Users/sven/Documents/myDev/DailyChallenges
hash -d dcl=~/Documents/myDev/DailyChallenge
hash -d sm=/media/sven/Windows/Users/sven/Documents/myDev/sheet-music

export DEFAULT_PYTHON_VENV=svenAIvenv
hash -d venv=~/.local/share/virtualenvs
export WORKON_HOME=~venv
export PROJECT_HOME=~md

# source ~venv/$DEFAULT_PYTHON_VENV/bin/virtualenvwrapper.sh
source ~venv/$DEFAULT_PYTHON_VENV/bin/activate  # commented out by conda initialize

# pnpm
export PNPM_HOME="/home/sven/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Load Angular CLI autocompletion.
# source <(ng completion script)

export DEBEMAIL="sven@buschke.com"
export DEBFULLNAME="Sven Buschke"
eval `keychain -q --agents ssh --eval id_ed25519`
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sven/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sven/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sven/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sven/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate r
# conda activate svenAI

hash -d matlab=/home/sven/.local/share/MATLAB/R2018a/bin
alias matlab=~matlab/matlab

export PATH="/home/sven/.local/share/JetBrains/Toolbox/scripts:$PATH"

function gal {
    git config --global alias.$1 $2
}

if ! mountpoint -q /mnt/wsl; then
    sudo guestmount --add /media/sven/Windows/Users/sven/AppData/Local/Packages/CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc/LocalState/ext4.vhdx -o uid=1000 -o gid=1000 -o allow_other --rw /mnt/wsl -m /dev/sda
fi

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#     tmux attach -t default || tmux new -s default
# fi

#if [ -n "$PS1" ] && [ -t 0 ]; then
#    tmux
#fi

export PATH="$PATH:/home/sven/Android/Sdk/platform-tools/"

alias fl="flutter"

function flb() {
    flutter build "$@"
}

function flr() {
    flutter run "$@"
}

function flc() {
    flutter create -e --org com.buschke --description "A new Flutter project by SvenSoft & BuscByte Innovation Forge"  "$@"
}

function flcs() {
    sample_name=$1
    project_name=$2
    flutter create --sample $sample_name --org com.buschke --description "A new Flutter project by SvenSoft & BuscByte Innovation Forge" $project_name
}


