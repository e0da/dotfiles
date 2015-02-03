#!/bin/zsh

for file in /usr/share/autojump/autojump.sh /usr/local/etc/autojump.zsh /usr/local/etc/autojump.sh; do
  if [ -e $file ]; then
    source $file
    return
  fi
done
