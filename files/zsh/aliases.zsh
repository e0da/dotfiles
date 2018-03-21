alias ack='ack-grep'
alias brake='bundle exec rake'
alias g='git'
alias grep='grep --color=auto'
alias t='test_launcher find'
alias here='xdg-open . 2>/dev/null'

for bin in rails rake spring rspec zat; do
  alias $bin="best-ruby-bin ${bin}"
done

# NeoVim a lot
for vi in v vi vim mvim gvim; do
  eval "alias $vi=nvim"
done

ls / --color &>/dev/null
if [ $? = 0 ]; then
  alias ls='ls --color=auto'
else
  alias ls='ls -G'
fi
