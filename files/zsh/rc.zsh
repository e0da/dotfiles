# ruby comes last because RVM complains about the order of the PATH.
for script in \
  environment  \
  prompts      \
  aliases      \
  heroku       \
  autojump     \
  functions    \
  ric          \
  local        \
  appfolio     \
  ruby         \
; do
  source $HOME/.zsh/$script.zsh
done
