# zsh
alias editzsh="$EDITOR $HOME/.zshrc"
alias sourcezsh="source $HOME/.zshrc"
# directories
alias dotfiles="cd $DOTFILES"
# software
alias phpunit="./vendor/bin/phpunit"
alias pest="./vendor/bin/pest"
alias tf="terraform"
# movement
alias cc="cd .."
alias cccc="cd ../../"
alias cccccc="cd ../../../"
alias la="ls -la"
alias fu="rm -rf"
alias www="cd ~/Sites"
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