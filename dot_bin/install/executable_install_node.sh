#!/usr/bin/env bash

type curl || (echo "Please install curl first" && exit 1)

[ -n $N_PREFIX ] || export N_PREFIX=$HOME/.n
curl -L https://bit.ly/n-install | N_PREFIX=~/.n bash -s -- -y lts
