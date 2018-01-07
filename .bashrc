#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  source ~/.bashmac.rc
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  source ~/.bashlinux.rc
fi
