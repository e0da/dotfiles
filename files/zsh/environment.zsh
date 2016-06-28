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
zstyle ':completion:*' show-completer true
zstyle :compinstall filename ~/.zshrc
autoload -Uz compinit
compinit
disable which # I HATE zsh which.
HISTFILE=$HOME/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd beep extendedglob nomatch notify autopushd

export THIS_SCRIPT=$0
export UNAME=$(uname)

# Helper functions
#
function use_coreutils_on_mac() {
  local gnupath='/usr/local/opt/coreutils/libexec'
  local gnubinpath="$gnupath/gnubin"
  local gnumanpath="$gnupath/gnuman"
  [ -d $gnubinpath ] && export PATH="$gnubinpath:$PATH"
  [ -d $gnumanpath ] && export MANPATH="$gnumanpath:$MANPATH"
}

function use_solarized_dircolors() {
  local path_to_this_script="$(perl -MCwd -e 'print Cwd::abs_path shift' "$THIS_SCRIPT")"
  local this_script_dir=$(dirname "$path_to_this_script")
  local git_repo_dir="$this_script_dir/../.."
  local dircolors_dir="$git_repo_dir/support/dircolors-solarized"
  eval "$(dircolors "$dircolors_dir/dircolors.ansi-dark")"
}

# max file descriptor limit on Mac
[ "$UNAME" = 'Darwin' ] && ulimit -n 10240

# brew-compatible zsh-completions
[ "$UNAME" = 'Darwin' ] && fpath=(/usr/local/share/zsh-completions $fpath)

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
export EDITOR=nvim
export GIT_EDITOR=nvim
export PATH=$HOME/bin:$HOME/opt/bin:/usr/local/sbin:/usr/local/bin:$PATH
use_coreutils_on_mac
use_solarized_dircolors

# automatically configure make -j option to -j{number of CPUs +1}
#
case $UNAME in
  Linux)
    let n_cores="$(grep -c processor /proc/cpuinfo)+1"
  ;;
  Darwin)
    let n_cores="$(sysctl -n hw.ncpu)+1"
  ;;
esac
export MAKEOPTS=-j${n_cores}

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
[ "$(uname)" = 'Linux' ] && export TERM=screen-256color 2>/dev/null

# Debian package development
#
export DEBEMAIL=justin.force@gmail.com
export DEBFULLNAME='Justin Force'

# Docker
export DOCKER_HOST=tcp://192.168.59.103:2375


# awscli completion
#
[ -f /usr/local/bin/aws_zsh_completer.sh ] &&
  source /usr/local/bin/aws_zsh_completer.sh

# APM
#
export APM_BUNDLE="$HOME/src/apm_bundle"
export MAILCATCHER_PROPERTY=yes
export MAILCATCHER_OPORTAL=yes
export MAILCATCHER_TPORTAL=yes

# Host-specific stuff
[ -f "$HOME/.zsh-local" ] && source "$HOME/.zsh-local"

# Replace the beer mug with something more appropriate because I FUCKING HATE
# HOMEBREW.
export HOMEBREW_INSTALL_BADGE="💩"
