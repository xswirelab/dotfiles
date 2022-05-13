# usr bin
export PATH=$HOME/bin:/usr/local/bin:$PATH

# composer bin
export PATH=$HOME/.composer/vendor/bin:$PATH

# dotfiles symlinks
export PATH=$DOTFILES/symlinks:$PATH

# visual studio code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH

# rust, cargo 
export PATH=$HOME/.cargo/bin:$PATH
source $HOME/.cargo/env

# java openjdk
#export PATH=/usr/local/opt/openjdk/bin:$PATH
#export CPPFLAGS="-I/usr/local/opt/openjdk/include"
