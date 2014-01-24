for location in $HOME/.rvm /usr/local/rvm; do
  [ -e $location ] && source $location/scripts/rvm
done

# Set character encoding to UTF-8. For fuck's sake!
export RUBYOPT="$RUBYOPT -Ku"
