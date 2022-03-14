setopt prompt_subst
source $(brew --prefix)/opt/gitstatus/gitstatus.prompt.zsh
SPY_FIRST_RUN=true
SPY_HOME="$HOME/.config/dirspy"
declare -A messages
messages[setup_spy]="[SPY] Setting up..."
messages[on_enter]="[SPY] Run on directory enter..."
messages[remove_spy]="[SPY] Removing spy"
messages[no_spy]="[SPY] Not being spied"

directoryHash() {
    echo -n $(echo -n $(pwd) | shasum | cut -d' ' -f1)
}

spyHomeDir() {
    echo "$SPY_HOME/"
}

spyCommandsDir() {
    echo "$SPY_HOME/commands/"
}

spyDir() {
    current=$(directoryHash)
    echo "$SPY_HOME/$current/" 
}

spyDotenv() {
    if test -f ".env"; then
        echo "$(shdotenv -d php --name-only)" > $(spyDir)dotenv_exported
        echo "#!/bin/sh" > $(spyDir)dotenv && chmod +x $(spyDir)dotenv
        echo "$(shdotenv -d php)" >> $(spyDir)dotenv
        source $(spyDir)dotenv
    fi
}

unloadDotenv() {
    if test -f ".env"; then
        if [ -d $(spyDir) ]; then
            spydotfile=$(spyDir)dotenv
            if test -f "$spydotfile"; then
                while read line; do
                    unset $line
                done < $(spyDir)dotenv_exported
                rm $spydotfile
            fi
        fi
    fi
}

spy() {
    if [ -d $(spyDir) ]; then
        cd $(spyDir)
        return
    fi

    echo "${messages[setup_spy]}"
    $(spyHomeDir)setup $(spyDir) bash
    dirSpyFirstRun
    return
}

unspy() {
    if [ -d $(spyDir) ]; then
        echo "${messages[remove_spy]}"
        rm -r $(spyDir)
        return
    fi
    echo "${messages[no_spy]}"
    return
}

dirSpyFirstRun() {
    if [ -d $(spyDir) ]; then
        echo "${messages[on_enter]}"
        $(spyDir)on_enter bash
    fi
}

dirSpyPrompt() {
    # set my prompt
    RPROMPT=''
    NEWLINE=$'\n'
    PROMPT='🦄 %{$fg[cyan]%}%c%{$reset_color%}'              # blue current working directory
    PROMPT+='${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT}'    # git status (requires promptvars option)
    PROMPT+='${NEWLINE}'
    PROMPT+='%{$fg[red]%}•%{$reset_color%} '

    # set rprompt if directory is being spied
    if [ -d $(spyDir) ]; then
    	RPROMPT='%{$fg[red]%}•%{$reset_color%}'
    	RPROMPT+='%{$fg[green]%}•%{$reset_color%}'
    	RPROMPT+='%{$fg[blue]%}•%{$reset_color%} '
    fi

    # run on_spy after running a command
    if [ -d $(spyDir) ]; then
        $(spyDir)on_spy bash
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd dirSpyPrompt
add-zsh-hook chpwd dirSpyFirstRun
add-zsh-hook chpwd unloadDotenv
add-zsh-hook zshexit unloadDotenv

trap unloadDotenv EXIT