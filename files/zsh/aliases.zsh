alias ack='ack-grep'
alias d='sudo docker'
alias g='git'
alias gg='gitg&!'
alias go=gnome-open
alias grep='grep --color=auto'
alias h='hub'
alias pr='hub pull-request'
alias v='vi'
alias vd='vagrant destroy'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias vs='vagrant ssh'
alias vu='vagrant up'

if [ `uname` = 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
