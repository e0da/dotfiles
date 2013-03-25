RVM_LOCATIONS="$HOME/.rvm /usr/local/rvm"
for location in $RVM_LOCATIONS; do
  source $location/scripts/rvm 2>/dev/null
  export PATH=$location/bin:$PATH
done
