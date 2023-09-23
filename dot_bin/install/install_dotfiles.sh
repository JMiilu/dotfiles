#!/usr/bin/env bash

type git || (echo "Please install git first" && exit 1)

config() {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

git clone --bare git@github.com:JMiilu/dotfiles.git $HOME/.dotfiles
config checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  mkdir -p .dotfiles-backup
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;

config checkout
config config --local status.showUntrackedFiles no
