#!/usr/bin/zsh

export PROMPT='%B%F{cyan}%m%F{white}:%F{blue}%~%F{white}%#%b%f '

source "$HOME/.zsh/git-prompt/zshrc.sh"
[ -x "$HOME/.bin/gitstatus" ] && export GIT_PROMPT_EXECUTABLE="haskell"

# shellcheck disable=SC2016
export RPROMPT='$(git_super_status)'
