# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh



convert2mp3() {
  ffmpeg -i $1 -codec:a libmp3lame -qscale:a 0 "$1.mp3"
}
new-haskell() {
  hi $1 --repository git://github.com/tippenein/haskeleton.git
}

new-servant() {
  hi $1 --repository git://github.com/tippenein/haskeleton-servant.git
}

whatis() {
  grep $1 ~/.aliases
}

dockerbash() {
  docker exec -it $1 bash
}

gunpair() {
  git config --local --unset-all user.name
  git config --local --unset-all user.email
  git config --local --unset-all user.initials
}

gclone() {
  git clone git@github.com:"$*"
}

new-branch() { git checkout -b $1 && git push --set-upstream origin $1; }

# ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"
#ZSH_THEME="agnoster"

DISABLE_CORRECTION="true"
plugins=(git virtualenv tmux)

source $ZSH/oh-my-zsh.sh
source $HOME/bin/z.sh
source $HOME/.aliases
source $HOME/.private
source $HOME/.zshenv

# Increase limit on number of files to watch because OS X's default is way too low
ulimit -n 2048

export PATH=$PATH:/usr/local/share/npm/bin
export PATH="$HOME/.local/bin:$PATH"

export MYSQL_HOME=/usr/local/mysql
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/:$DYLD_LIBRARY_PATH
export EDITOR='vim'
# export TERM='screen-256color'
export TERM='screen-256color-bce'

### Configuration files for Postgres (-D option)
export PGDATA="/usr/local/var/postgres"
export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export NIX_PATH=nixpkgs=$HOME/Documents/nixpkgs

export ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export DB_BRANCH=master
export PATH="$HOME/.rbenv/bin:$PATH"
