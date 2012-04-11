#!/bin/sh

cd bundle

for f in *; do
  cd $f
  git checkout master
  git pull
  cd ..
done
