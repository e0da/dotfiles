for script in  \
  environment  \
  prompts      \
  aliases      \
  autojump     \
  functions    \
  local        \
; do
  source "$HOME/.zsh/$script.zsh"
done

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
