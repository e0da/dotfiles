#!/bin/sh

cd bundle
for f in *; do
  cd $f
  git pull
  cd ..
done
cd ..

