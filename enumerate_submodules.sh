#!/bin/sh

for d in bundle/*; do
  CWD=`pwd`
  cd "$d"
  URL=`git remote show origin|grep github.com|head -n1|awk '{print $3}'`
  echo $URL >> $CWD/submodules.new.txt
  cd $CWD
done
