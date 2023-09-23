#!/usr/bin/env bash
# https://github.com/pyenv/pyenv-installer
# https://github.com/pyenv/pyenv

type curl || (echo "Please install curl first" && exit 1)

curl https://pyenv.run | bash
