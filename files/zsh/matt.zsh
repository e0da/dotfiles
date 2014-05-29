function kp() {
  for proc in passenger nginx multiplexer_ctl scheduler_ctl memcached; do
    nuke $proc 2
  done && osascript -e 'tell application "Terminal" to quit'
}

function nuke() {
  ps ax | pgrep $1 | awk '{print $1}' | xargs kill -15 $1 2> /dev/null ||
  ps ax | pgrep $1 | awk '{print $1}' | xargs kill  -1 $1 2> /dev/null ||
  ps ax | pgrep $1 | awk '{print $1}' | xargs kill  -2 $1 2> /dev/null ||
  ps ax | pgrep $1 | awk '{print $1}' | xargs kill  -9 $1 2> /dev/null
}

function retag() {
  rm tags tags 2> /dev/null; ctags --exclude=.git --exclude=tmp --exclude='*.log' -R * `bundle show --paths` 2> /dev/null
}
