#!/bin/bash

if [ "$USER" != 'root' ]; then
  echo 'Must be run as root. Try sudo.' >&2
  exit 1
fi

patch '/etc/default/grub' 'etc-default-grub.patch'
update-grub
