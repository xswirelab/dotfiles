# usr bin
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# composer bin
export PATH=$HOME/.composer/vendor/bin:$PATH

# dotfiles symlinks
export PATH=$DOTFILES/symlinks:$PATH

# visual studio code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH

# rust, cargo 
export PATH=$HOME/.cargo/bin:$PATH
source $HOME/.cargo/env

# ruby gems
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH=$GEM_HOME/ruby/2.6.0/bin:$PATH

# java openjdk
#export PATH=/usr/local/opt/openjdk/bin:$PATH
#export CPPFLAGS="-I/usr/local/opt/openjdk/include"
