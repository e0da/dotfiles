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
