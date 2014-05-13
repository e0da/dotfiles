zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'l:|=* r:|=*' 'r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
disable which # I HATE zsh which.
HISTFILE=$HOME/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd beep extendedglob nomatch notify autopushd

# C-x C-e command editing
#
autoload -U edit-command-line
zle -N edit-command-line
bindkey -e
bindkey '^X^E' edit-command-line
bindkey '^R' history-incremental-pattern-search-backward

# Fix C-[left] C-[right] behavior
#
bindkey ';5C' forward-word
bindkey ';5D' backward-word

# command not found
#
[ -f /etc/zsh_command_not_found ] && source /etc/zsh_command_not_found

# environment
#
export PATH=/usr/local/bin:$HOME/bin:$HOME/opt/bin:$PATH
export EDITOR=vi
export GIT_EDITOR=vi

# automatically configure make -j option to -j{number of CPUs +1}
#
[ `uname` = 'Darwin' ] || let MAKEJOBS=$(grep -c processor /proc/cpuinfo)+1
export MAKEOPTS=-j${MAKEJOBS}

# Set TERM to screen-256color (my modified, overridden custom terminfo with no
# fucking italics).
#
# To create the custom terminfo,
#
#    infocmp screen-256color \
#      | sed 's/screen-256color/screen-256color/' \
#      | sed 's/colors,$/colors without fucking italics,/' \
#      | sed 's/3m/7m/g' \
#      > /tmp/terminfo \
#      && tic /tmp/terminfo
#
export TERM=screen-256color 2>/dev/null

# Debian package development
#
export DEBEMAIL=justin.force@gmail.com
export DEBFULLNAME='Justin Force'

# awscli completion
#
[ -f /usr/local/bin/aws_zsh_completer.sh ] &&
  source /usr/local/bin/aws_zsh_completer.sh
