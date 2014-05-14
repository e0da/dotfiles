for file in /usr/share/autojump/autojump.sh /usr/local/etc/autojump.sh; do
  [ -e $file ] && source $file
done
