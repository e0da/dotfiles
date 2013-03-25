for location in $HOME/.rvm /usr/local/rvm; do
  source $location/scripts/rvm 2>/dev/null
  export PATH=$location/bin:$PATH
done
