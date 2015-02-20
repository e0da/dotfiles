function g
  git $argv
end

set -l gnupath /usr/local/opt/coreutils/libexec
set -l gnubinpath $gnupath/gnubin
set -l gnumanpath $gnupath/gnuman

if test -d $gnubinpath
  set PATH $gnubinpath $PATH
end

if test -d $gnumanpath
  set MANPATH ":$gnumanpath:$MANPATH"
end

set PATH $HOME/bin $HOME/opt/bin /usr/local/sbin /usr/local/bin $PATH

set -x GREP_OPTIONS

function grep
  command grep --color=auto $argv
end

# vim: set filetype=fish:
