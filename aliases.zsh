# zsh
alias editzsh="$EDITOR $DOTFILES/.zshrc"
alias .ez="$EDITOR $DOTFILES/.zshrc"
alias .ea="$EDITOR $DOTFILES/aliases.zsh"
alias .ef="$EDITOR $DOTFILES/functions.zsh"
alias .ee="$EDITOR $DOTFILES/environment.zsh"
alias .ep="$EDITOR $DOTFILES/paths.zsh"
alias .es="$EDITOR $DOTFILES/secrets.zsh"
alias .et="$EDITOR $DOTFILES/theme.zsh"
alias sourcezsh="source $HOME/.zshrc"
alias .s="source $DOTFILES/.zshrc && echo '.zshrc sourced'"
# software
alias phpunit="./vendor/bin/phpunit"
alias pest="./vendor/bin/pest"
alias tf="terraform"
alias .e="edit"
# movement
alias cc="cd .."
alias cccc="cd ../../"
alias cccccc="cd ../../../"
alias la="ls -la"
alias fu="rm -rf"
alias www="cd $HOME/Sites"
alias symlinks="cd $DOTFILES/symlinks"
alias dotfiles="cd $DOTFILES"
alias .f="cd $DOTFILES"
alias .w="cd $HOME/Sites"
# php craft / laravel / etc
alias art="php artisan"
alias craft="php craft"
alias dump="composer dump-autoload"
# git 
alias switch="git checkout"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs="git status"
# homebrew
alias mkbrewfile="brew bundle dump --file=$DOTFILES/Brewfile"
alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"
# npm 
alias npmi="npm install --no-save"
