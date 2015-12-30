# Dirty hack for gvim not integrating with unity when launched from command line
#   https://bugs.launchpad.net/ubuntu/+source/vim/+bug/776499
function gvim() {
  /usr/bin/gvim -f "$@" "&!"
}

function notify_sshable() {
  local host=$1
  local timeout=${2:-1}
  local sound="${3:-$HOME/Dropbox/sounds/LOZ_Secret.wav}"
  local iteration=0
  local player=$( (which afplay &>/dev/null && echo afplay) || echo aplay)

  while true; do
    let iteration=$iteration+1
    echo "Attempt $iteration..."
    ssh -oConnectTimeout="$timeout" "$host" true
    if [ $? = 0 ]; then
      $player "$sound" &
      break
    fi
  done
}

# Adapted from Matt Schartman's function.
function retag() {
  rm tags tags 2> /dev/null

  # shellcheck disable=SC2046
  ctags \
    --exclude=.git \
    --exclude=tmp \
    --exclude='*.log' \
    -R \
    ./* $(bundle show --paths) 2> /dev/null
}

# Given a session name, try to attach to that tmux session. If the session
# doesn't exist, create a session with the given name and attach to it.
function taon {
  name="$1"
  tmux attach -t "$name" || tmux new -s "$name"
}

# enable pasting of command lines beginning with $. When do you ever mean to
# start a command with '$'?
#
# source: http://stackoverflow.com/questions/68372/what-is-your-single-most-favorite-command-line-trick-using-bash
function \$ {
  "$@"
}
