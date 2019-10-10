cfg_repo="$HOME/Dropbox/git/cfg-$HOST"
cfg_git="$cfg_repo/.git"
cfg_gitignore="$HOME/.gitignore"

function cfg-cd() {
  cd "$cfg_repo"
}

function cfg-init() {
  (
    set -ex
    mkdir -p "$cfg_repo"
    test -d "$cfg_git" || git init "$cfg_repo"
    test -f "$cfg_gitignore" || echo '*' | tee "$cfg_gitignore"
  )
}

alias cfg="git --git-dir=$cfg_repo/.git --work-tree=$HOME"
alias dcom='docker-compose'
alias g='git'
alias grep='grep --color=auto'
alias here='xdg-open . 2>/dev/null'
alias ls='ls --color=auto'
alias rmt='find . -type d -empty -exec rmdir "{}" \;'
alias winning='source ~/.zsh/winning.zsh'

for bin in pry rails rake spring rspec zat sidekiq; do
  alias $bin="best-ruby-bin ${bin}"
done

# NeoVim a lot
for vi in v vi vim mvim gvim; do
  eval "alias $vi=nvim"
done
