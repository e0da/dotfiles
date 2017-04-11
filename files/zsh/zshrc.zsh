for script in  \
  environment  \
  prompts      \
  aliases      \
  autojump     \
  functions    \
  fzf          \
  local        \
; do
  source "$HOME/.zsh/$script.zsh"
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Load RVM as a shell function unless it's already loaded
type rvm | grep -v 'shell function' >/dev/null
if [[ 0 = $? && -f $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
