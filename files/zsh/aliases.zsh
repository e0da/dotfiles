# show all git aliases
#
function git_aliases() {
  git config --get-regexp alias | sed 's/^alias\.//g' | awk '{printf "%7s %s %s %s %s %s %s %s %s %s\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}'
}

alias ack='ack-grep'
alias g='git'
alias gg='gitg&!'
alias go=gnome-open
alias grep='grep --color=auto'
alias h='hub'
alias ls='ls --color=auto'
alias pr='hub pull-request'
alias v='vi'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias vs='vagrant ssh'
alias vu='vagrant up'
