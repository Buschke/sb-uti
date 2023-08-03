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
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 2
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true
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
bindkey -v
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/sven/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sven/.local/share/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sven/.local/share/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sven/.local/share/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sven/.local/share/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

export DEBEMAIL="sven@buschke.com"
export DEBFULLNAME="Sven Buschke"
eval `keychain -q --agents ssh --eval id_ed25519`

# <<< conda initialize <<<

# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g=git

hash -d md=~/Documents/myDev
hash -d dc=~/Documents/myDev/DailyChallenge
hash -d dcwin=/mnt/c/Users/sven/Documents/myDev/DailyChallenges

export DEFAULT_PYTHON_CONDA=svenR
export DEFAULT_PYTHON_VENV=svenAIvenv
conda activate $DEFAULT_PYTHON_CONDA
hash -d venv=~/.local/share/virtualenvs
export WORKON_HOME=~venv
export PROJECT_HOME=~md
source ~venv/$DEFAULT_PYTHON_VENV/bin/activate  # commented out by conda initialize  # commented out by conda initialize

export PATH=~/.local/share/bin:$PATH
# source $WORKON_HOME/svenAIvenv/bin/virtualenvwrapper.sh

# Load Angular CLI autocompletion.
source <(ng completion script)

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


