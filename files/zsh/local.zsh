ZLOCAL=$HOME/Dropbox/config/zlocal

for script in \
  global \
  $HOST \
; do
  [ -e $ZLOCAL/$script ] && source $ZLOCAL/$script
done
