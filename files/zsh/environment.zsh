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

zsh_opts=(
  autocd             # Allows typing path without cd to cd, e.g. `..` == `cd ..`
  autopushd          # push directories to stack when using cd/autocd
  beep               # Beep on error
  extendedglob       # Does what it says
  inc_append_history # History is appended before each command is run
  nomatch            # Print an error when no file matches completion pattern
  notify             # Report status of background jobs immediately
  share_history      # History is read each time prompt is printed
)
setopt "${zsh_opts[@]}"

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
[ -f /etc/zsh_command_not_found ] && source /etc/zsh_command_not_found

# find-the-command
[ -f /usr/share/doc/find-the-command/ftc.zsh ] && source /usr/share/doc/find-the-command/ftc.zsh

# environment
#
export EDITOR=nvim
export GIT_EDITOR=nvim
export PATH=./node_modules/.bin:$HOME/bin:$HOME/.local/bin:$HOME/.local/opt/bin:/usr/local/sbin:/usr/local/bin:$PATH
use_coreutils_on_mac

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

# Make stupid Mac garbage do colors
export CLICOLORS=1

# Add Postgres bins to PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin

# TrackR
export devdb="trackr_web_development"

# Load any local secret environment variables
[ -f $HOME/.secrets ] && source $HOME/.secrets

# The Fuck
which thefuck &>/dev/null && eval $(thefuck --alias)

# dircolors if you got 'em
[ -f $HOME/.dircolors ] && eval $(dircolors $HOME/.dircolors)

# Default host for psql bin
export PGHOST=localhost
