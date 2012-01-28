#!/bin/sh

# update all bundled plugins
#
cd bundle
for f in *; do
  cd $f
  git checkout master
  git pull
  cd ..
done
cd ..

# update Vim documentation
#
vim +Helptags +q
