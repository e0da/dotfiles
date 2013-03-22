ZLOCAL=$HOME/Dropbox/config/zlocal

##
# Loads all local (secret/sensitive) zsh scripts. Put in a function so we can
# reload them at will! YES!
#
function reloc() {
  for script in \
    global \
    $HOST \
  ; do
    [ -e $ZLOCAL/$script ] && source $ZLOCAL/$script
  done
}

reloc
