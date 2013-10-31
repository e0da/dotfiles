export PROMPT='%B%F{darkcyan}%m%F{darkwhite}:%F{blue}%~%F{darkwhite}%#%b%f '
source $HOME/.zsh/git-prompt/zshrc.sh
export ZSH_THEME_GIT_PROMPT_NOCACHE=1
export RPROMPT='$(git_super_status)'
