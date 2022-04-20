# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles
export DOTTOOLS=$DOTFILES/tools

# zsh path 
export ZSH_CUSTOM=$DOTFILES
export ZSH=$HOME/.oh-my-zsh

# my editor
export EDITOR=micro
export MICRO_CONFIG_HOME=$DOTFILES/config/micro
# lang settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
# git
export GITHUB_USER="xswirelab"
export GITHUB_ORG="wirelab"
# some software dirs
export WATSON_DIR=$HOME/Dropbox/watson

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
