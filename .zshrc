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

for dotfile in ${dotfiles[@]}; do source $HOME/.dotfiles/$dotfile ; done

# zsh settings
export HISTFILE=$HOME/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

plugins=(z)

source $ZSH/oh-my-zsh.sh

# fix fo for scripts that echo new lines and suddenly see '-'
PROMPT_EOL_MARK=''
# some shit I have to google
autoload -U +X bashcompinit && bashcompinit
# terraform completion
complete -o nospace -C /usr/local/bin/terraform terraform
# some shit I have to google
autoload compinit
compinit
zstyle ':completion:*' menu select=3
# iterm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# start up check on xdebug, cause it makes php slow when not needed
# xdebug-toggle

