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

##
# Opens an editor in the zlocal directory for convenience.
#
# Use gvim if there's a display, otherwise use vim.
#
function edloc() {
  __edloc_NOGUI=
  case "$1" in
    '-G')
      __edloc_NOGUI=yes
      ;;
    '')
      ;;
    *)
      echo "Usage: edloc [-G]"
      echo "\t-G disables GUI in GUI-enabled environments"
      return
      ;;
  esac

  case "$DISPLAY" in
    '')
      vim  $ZLOCAL
      ;;
    *)
      case "$__edloc_NOGUI" in
        yes)
          vim $ZLOCAL ;;
        *)
          gvim $ZLOCAL ;;
      esac
      ;;
  esac
}

reloc
