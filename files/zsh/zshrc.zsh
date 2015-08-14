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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
