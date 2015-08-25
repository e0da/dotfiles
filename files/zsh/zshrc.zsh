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

# rbenv
export RBENV_VERSION_PREFIX_NOWARN=1
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source "$HOME/.rbenv/completions/rbenv.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
