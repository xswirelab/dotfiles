autoload -U add-zsh-hook

# CHPWD
# -- below all chpwd hooks

# Load NVMRC
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
# add the hook to chpwd
add-zsh-hook chpwd load-nvmrc
# run on every new session as well 
emulate -L zsh; load-nvmrc


# Run LS command
run-ls() {
	la
}

add-zsh-hook chpwd run-ls
