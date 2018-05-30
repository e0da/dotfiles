# vi: set ft=sh: -- So ShellCheck can check it

# Dirty hack for gvim not integrating with unity when launched from command line
#   https://bugs.launchpad.net/ubuntu/+source/vim/+bug/776499
function gvim {
  /usr/bin/gvim -f "$@" "&!"
}

function notify_sshable {
  local host=$1
  local timeout=${2:-1}
  local sound="${3:-$HOME/Dropbox/sounds/LOZ_Secret.wav}"
  local iteration=0
  local player

  player=$( (which afplay &>/dev/null && echo afplay) || echo aplay)

  while true; do
    let iteration=$iteration+1
    echo "Attempt $iteration..."
    if ssh -oConnectTimeout="$timeout" "$host" true; then
      $player "$sound" &
      break
    fi
  done
}

# Given a session name, try to attach to that tmux session. If the session
# doesn't exist, create a session with the given name and attach to it. If no
# name is given, calculate a name based on the current directory.
function taon {
  local name=${1:-$(basename "$(pwd)" | sed 's/\W\+/-/g')}
  tmux attach -t "$name" || tmux new -s "$name"
}

# Prints the names of any tags containing the word release that are not found in
# the CHANGELOG or Rakefile (CHANGELOG lists all releases; Rakefile lists all
# tags (which may or may not exist anymore) which were created erroneously and
# do not correspond to a release.
function check-release-tags {
  git tag | grep release | while read -r tag; do
    grep "$tag" CHANGELOG.md Rakefile >/dev/null || echo "$tag"
  done
}

function rbenv {
  CC=/usr/bin/gcc-6 command rbenv "$@"
}

# enable pasting of command lines beginning with $. When do you ever mean to
# start a command with '$'?
#
# source: http://stackoverflow.com/questions/68372/what-is-your-single-most-favorite-command-line-trick-using-bash
#
# ShellCheck struggles with this one because it's goofy, so construct it
# carefully and disable the '{ is a literal' warning
# shellcheck disable=SC1083
function '$' { "$@" }
