# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/bin/z.sh

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

splink() {
  ln -s ~/Documents/$1\ Project ~/Splice/$1\ Project
}

new-branch() { git checkout -b $1 && git push --set-upstream origin $1; }

# ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"
#ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenv tmux)

# alias hdevtools="stack exec --no-ghc-package-path hdevtools --"
# Increase limit on number of files to watch because OS X's default is way too low
ulimit -n 2048

export PATH=$PATH:/usr/local/share/npm/bin
# export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export MYSQL_HOME=/usr/local/mysql
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/:$DYLD_LIBRARY_PATH
export EDITOR='vim'
export TERM='xterm-256color'

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

source $HOME/.private
source $HOME/.zshenv

export DB_BRANCH=master
