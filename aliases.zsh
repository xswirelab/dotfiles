# zsh
alias .e="edit"
alias editzsh="$EDITOR $DOTFILES/.zshrc"
alias .ez="$EDITOR $DOTFILES/.zshrc"
alias .ea="$EDITOR $DOTFILES/aliases.zsh"
alias .ef="$EDITOR $DOTFILES/functions.zsh"
alias .ee="$EDITOR $DOTFILES/environment.zsh"
alias .ep="$EDITOR $DOTFILES/paths.zsh"
alias .es="$EDITOR $DOTFILES/secrets.zsh"
alias .et="$EDITOR $DOTFILES/theme.zsh"
alias .eh="$EDITOR $DOTFILES/hooks.zsh"
alias sourcezsh="source $HOME/.zshrc"
alias .s="source $DOTFILES/.zshrc && echo '.zshrc sourced'"
alias .sz="source $DOTFILES/.zshrc && echo '.zshrc sourced'"
alias history="history -i"
# fun
alias party="open raycast://confetti"
# software
alias rector="./vendor/bin/rector"
alias pint="./vendor/bin/pint"
alias phpunit="./vendor/bin/phpunit"
alias pest="./vendor/bin/pest"
alias tf="terraform"
# movement
alias cc="cd .."
alias cccc="cd ../../"
alias cccccc="cd ../../../"
# exa and lsd
alias la="lsd -la"
alias ls='exa --icons --group-directories-first --time-style=long-iso -h'
alias l='exa -l --all --no-user --group-directories-first --icons --no-permissions --no-time -h -G'
alias ll='exa -l --all --all --group-directories-first --git --icons --time-style=long-iso -h'
alias lt='exa -T --git-ignore --level=2 --group-directories-first --icons --time-style=long-iso -h'
alias llt='exa -lT --git-ignore --level=2 --group-directories-first --icons --time-style=long-iso -h'
alias lT='exa -T --git-ignore --level=4 --group-directories-first --icons --time-style=long-iso -h'
# other
alias fu="rm -rf"
alias www="cd $HOME/Sites"
alias symlinks="cd $DOTFILES/symlinks"
alias dotfiles="cd $DOTFILES"
alias .f="cd $DOTFILES"
alias .w="cd $HOME/Sites"
alias icloud="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/"
# plant uml
alias plantuml="java -jar $HOME/bin/plantuml-1.2022.4.jar"
alias uml="icloud && cd UML && plantuml"
# php craft / laravel / etc
alias mysqldump="/Users/Shared/DBngin/mysql/5.7.23/bin/mysqldump"
alias composer="valet composer"
alias php="valet php"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias routes="php artisan route:list"
alias php="valet php"
alias craft="php craft"
alias art="php artisan"
alias dump="composer dump-autoload"
# docker
alias docker=podman
# git 
alias switch="git checkout"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs="git status"
alias gdev="git checkout development"
alias gacc="git checkout acceptance"
# homebrew
alias mkbrewfile="brew bundle dump --file=$DOTFILES/Brewfile"
alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"
# containers
# alias docker="podman"
# npm 
alias npmi="npm install --no-save"
