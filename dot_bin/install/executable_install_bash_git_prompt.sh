#!/usr/bin/env bash

type git || (echo "Please install git first" && exit 1)

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
