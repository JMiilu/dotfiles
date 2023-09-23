#!/usr/bin/env bash

# vim-plug
# curl -fLo ~/.vim/autoload/plug.vim \
#   --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

PACKDIR="$HOME/.vim/pack/plugins/start"
PACKAGES=("lifepillar/vim-gruvbox8" "tpope/vim-fugitive")

if [ ! -d $PACKDIR ]; then
  mkdir -p $PACKDIR
  pushd $PACKDIR

  for package in "${PACKAGES[@]}"; do
    git clone https://github.com/${package}.git
  done
fi

popd

