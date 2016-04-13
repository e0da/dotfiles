ZLOCAL="$HOME/Dropbox/config/zlocal"

##
# Loads all local (secret/sensitive) zsh scripts. Put in a function so we can
# reload them at will! YES!
#
function reloc() {
  for script in \
    global \
    $HOST \
    $HOST.local \
  ; do
    [ -e "$ZLOCAL/$script" ] && source "$ZLOCAL/$script"
  done
}

##
# Opens an editor in the zlocal directory for convenience.
#
function edloc() {
  $EDITOR "$ZLOCAL"
}

reloc
