alias ack='ack-grep'
alias brake='bundle exec rake'
alias d='sudo docker'
alias g='git'
alias gg='gitg&!'
alias go=gnome-open
alias grake='rake -g'
alias grep='grep --color=auto'
alias h='hub'
alias pr='hub pull-request'
alias v='vi'
alias vd='vagrant destroy'
alias vh='vagrant halt'
alias vi='vim'
alias vp='vagrant provision'
alias vs='vagrant ssh'
alias vu='vagrant up'

if [ `uname` = 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias t='test_runner find'
