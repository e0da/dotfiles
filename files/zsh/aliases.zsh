alias dcom='docker-compose'
alias g='git'
alias grep='grep --color=auto'
alias here='xdg-open . 2>/dev/null'
alias ls='ls --color=auto'
alias rmt='find . -type d -empty -exec rmdir "{}" \;'
alias secrets="git --git-dir=$HOME/.secrets --work-tree=$HOME"

for bin in pry rails rake spring rspec zat sidekiq; do
  alias $bin="best-ruby-bin ${bin}"
done

# NeoVim a lot
for vi in v vi vim mvim gvim; do
  eval "alias $vi=nvim"
done
