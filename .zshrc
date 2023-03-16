# source dotfiles
export DOTFILES=$HOME/.dotfiles

if test -f "$DOTFILES/secrets.zsh"; then
else 
	touch secrets.zsh
fi

dotfiles=(
 paths.zsh
 environment.zsh
 aliases.zsh
 functions.zsh
 secrets.zsh
 theme.zsh
 hooks.zsh
)

for dotfile in ${dotfiles[@]}; do source $DOTFILES/$dotfile ; done

# zsh settings
export HISTFILE=$HOME/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

plugins=(
 z
 zsh-autosuggestions
)

# https://github.com/zsh-users/zsh-autosuggestions

source $ZSH/oh-my-zsh.sh

# fix fo for scripts that echo new lines and suddenly see '-'
PROMPT_EOL_MARK=''
# some shit I have to google
autoload -U +X bashcompinit && bashcompinit
# terraform completion
# complete -o nospace -C /usr/local/bin/terraform terraform
# some shit I have to google
autoload compinit
compinit
zstyle ':completion:*' menu select=3
# source 1password
source $HOME/.config/op/plugins.sh

# iterm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# artisan autocomplete
_artisan()
{
	COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
	COMMANDS=`php artisan --raw --no-ansi list | sed "s/[[:space:]].*//g"`
	COMPREPLY=(`compgen -W "$COMMANDS" -- "${COMP_WORDS[COMP_CWORD]}"`)
	return 0
}
complete -F _artisan -o nospace art
complete -F _artisan -o nospace artisan


# start up check on xdebug, cause it makes php slow when not needed
# xdebug-toggle

