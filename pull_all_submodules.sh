#!/bin/sh

cd bundle

for f in *; do
  cd $f
  echo "Updating $f..."
  git checkout master
  git pull
  echo
  cd ..
done
