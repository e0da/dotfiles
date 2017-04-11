#!/bin/zsh

for file in /usr/{local/etc,share/autojump}/autojump.{,z}sh; do
  if [ -e $file ]; then
    source $file
    return
  fi
done
