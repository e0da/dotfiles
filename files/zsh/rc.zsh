# ruby comes last because RVM complains about the order of the PATH.
for script in  \
  environment  \
  prompts      \
  aliases      \
  autojump     \
  functions    \
  local        \
  matt         \
  ruby         \
; do
  source $HOME/.zsh/$script.zsh
done
