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
