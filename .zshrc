# The following lines were added by compinstall

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
zstyle :compinstall filename '/home/force/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
EDITOR=vim
# End of lines configured by zsh-newuser-install

# aliases
alias ls='ls --color=auto'

source /etc/zsh_command_not_found

fg_cyan=$'%{\e[1;36m%}'
fg_plain=$'%{\e[0m%]'
fg_white=$'%{\e[1;37m%}'
fg_green=$'%{\e[1;32m%}'
fg_blue=$'%{\e[1;34m%}'
PROMPT="$fg_cyan%n$fg_white@$fg_cyan%m$fg_white:$fg_blue%~$fg_white%#$fg_plain"
RPROMPT="$fg_white%{[%}$fg_cyan #%h %* %D$fg_white ]$fg_plain"

