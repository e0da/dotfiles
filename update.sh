#!/bin/sh

# update all bundled plugins
#
cd bundle
for f in *; do
  cd $f
  git pull
  cd ..
done
cd ..

# update Vim documentation
#
vim +Helptags +q
