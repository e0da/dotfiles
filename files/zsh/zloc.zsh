_ZLOC_PATH="$HOME/Dropbox/config/zloc"

##
# Loads all local (secret/sensitive) zsh scripts. Put in a function so we can
# reload them at will! YES!
#
function zloc-load() {
  for scope in global $(hostname -s); do
    script="$_ZLOC_PATH/$scope"
    [ -e "$script" ] && source "$script"
  done
}

##
# Opens an editor in the zloc directory for convenience.
#
function zloc-edit() {
  $EDITOR "$_ZLOC_PATH"
}

zloc-load
