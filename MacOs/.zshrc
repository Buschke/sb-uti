# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/opt/homebrew/bin:$PATH"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# mkdir -p "$(dirname $ZINIT_HOME)"
# git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# source /usr/local/opt/zinit/zinit.zsh
# source $(brew --prefix)/opt/zinit/zinit.zsh
# source ~/.local/share/zinit/zinit.git/zinit.sh

# source /usr/local/opt/zinit/zinit.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/sven/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#         . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g=git

hash -d md=~/Documents/myDev
hash -d dc=~md/DailyChallenge
hash -d sm=~md/sheet-music

#export JAVA_HOME=$(/usr/libexec/java_home)
#export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HOME/bin
# export DEFAULT_PYTHON_CONDA=py3
# export DEFAULT_PYTHON_VENV=py3venv
export DEFAULT_PYTHON_VENV=svenAIvenv
# conda activate $DEFAULT_PYTHON_CONDA
hash -d venv=~/.local/share/virtualenvs
source ~venv/$DEFAULT_PYTHON_VENV/bin/activate
export WORKON_HOME=~venv
export PROJECT_HOME=~md

setopt auto_cd

# python links
export PATH=$PATH:/usr/local/opt/python@3.11/libexec/bin

# Load Angular CLI autocompletion.
source <(ng completion script)

## case-insensitive (uppercase from lowercase) completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## case-insensitive,partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# export WORKON_HOME=.local/share/virtualenvs/
# export PROJECT_HOME=$HOME/Documents/myDev
# source .local/share/virtualenvs/py3venv/bin/virtualenvwrapper.sh
# source .local/share/virtualenvs/svenAI/bin/virtualenvwrapper.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zdharma-continuum/zinit-annex-as-monitor \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$PATH:/Users/sven/Library/Android/sdk/platform-tools"

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

