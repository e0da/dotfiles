alias g='git'
alias grep='grep --color=auto'
alias here='xdg-open . 2>/dev/null'

for bin in pry rails rake spring rspec zat sidekiq; do
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

# work
alias bkcl='xdg-open "https://github.com/TrackRbyPhoneHalo/TrackR/blob/master/CHANGELOG.md"'
