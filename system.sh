#!/bin/bash
set -e

sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:ubuntu-elisp/ppa
sudo add-apt-repository -y ppa:hvr/ghc
sudo add-apt-repository -y ppa:neovim-ppa/unstable


sudo apt-get purge unity-webapps-common
sudo apt-get purge unity-lens-shopping

sudo apt-get update

sudo apt-get install -y git zsh emacs-snapshot mosh tmux screen htop silversearcher-ag mumble darcs libtinfo-dev inotify-tools vim rake neovim build-essential

wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
sudo sh -c 'echo "deb http://download.fpcomplete.com/ubuntu/$(lsb_release -cs) stable main"|sudo tee /etc/apt/sources.list.d/fpco.list'
sudo apt-get update && sudo apt-get install stack -y

sudo apt-get update
sudo apt-get install -y ghc-7.10.3
sudo apt-get install -y cabal-install-1.22

sudo ln -sf /opt/ghc/7.10.3/bin/ghc /usr/bin/ghc
sudo ln -sf /opt/ghc/7.10.3/bin/ghci /usr/bin/ghci
sudo ln -sf /opt/ghc/7.10.3/bin/ghc-pkg /usr/bin/ghc-pkg
sudo ln -sf /opt/ghc/7.10.3/bin/runhaskell /usr/bin/runhaskell

sudo ln -sf /opt/cabal/1.22/bin/cabal /usr/bin/cabal

cabal update

touch ~/.secrets
mkdir -p ~/workspace
stack setup
stack install hoogle hdevtools ghc-mod hlint stylish-haskell
hoogle data
zsh
. ~/.zshrc
