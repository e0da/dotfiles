# show all git aliases
#
function git_aliases() {
  git config --get-regexp alias | sed 's/^alias\.//g' | awk '{printf "%7s %s %s %s %s %s %s %s %s %s\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}'
}

alias g='git'
alias gg='gitg&!'
alias go=gnome-open
alias grep='grep --color=auto'
alias h='heroku'
alias ls='ls --color=auto'
