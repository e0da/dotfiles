# enable pasting of command lines beginning with $. When do you ever mean to
# start a command with '$'?
#
# source: http://stackoverflow.com/questions/68372/what-is-your-single-most-favorite-command-line-trick-using-bash
function $ {
  $@
}

# Dirty hack for gvim not integrating with unity when launched from command line
#   https://bugs.launchpad.net/ubuntu/+source/vim/+bug/776499
function gvim() {
  /usr/bin/gvim -f $* &!
}

# sanitize ~/.ssh/known_hosts by removing chunks which break `ssh-keygen -R`. If
# a line number is supplied, also delete that line.
#
function khk() {
  known_hosts=~/.ssh/known_hosts
  if [ "$1" != "" ]; then
    sed -i ${1}d $known_hosts
  fi
  sed -i 's/,<[^>]*>//g' $known_hosts
}

# wrap ssh-keygen so that we always sanitize the file before calling
# `ssh-keygen -R`
#
function ssh-keygen-wrapper() {
  khk
  ssh-keygen $*
}
alias ssh-keygen=ssh-keygen-wrapper


# wrap knife ssh with my constant arguments since their config file doesn't
# support it FOR SOME RAISIN
#
function kssh() {
  knife ssh -x justinforce -a name $*
}

##
# Opens an ssh tunnel to repo01 and opens a browser to RabbitMQ management
# interface.
#
# Arguments:
#   $1: local port to listen on (defaults to 55672)
#
function rmq() {
  : ${1=55672}
  local_port=$1
  ssh repo01 -fNL${local_port}:flint-mq01:55672
  url=http://localhost:$local_port
  open $url || gnome-open $url
}

function shmux() {
  host=$1 && shift
  ssh $host -t tmux $*
}

function eshmux() {
  exec shmux $*
}
