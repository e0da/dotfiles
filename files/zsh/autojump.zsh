for file in /usr/share/autojump/autojump.sh /usr/local/etc/autojump.zsh; do
  [ -e $file ] && source $file
done
