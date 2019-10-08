paths=(
  ./node_modules/.bin

  $HOME/bin
  $HOME/.local/bin
  $HOME/.local/opt/bin
  $HOME/src/rok8s-scripts/bin

  $HOME/go/bin

  /snap/bin
  /usr/local/bin
  /usr/local/sbin
)
path_with_leading_comma=$(printf ":%s" "${paths[@]}")
export PATH=${path_with_leading_comma:1}:$PATH
