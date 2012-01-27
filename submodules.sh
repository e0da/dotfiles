#!/bin/sh

cat submodules.txt | while read f; do
  git submodule add $f ./bundle/`basename $f .git`
done
