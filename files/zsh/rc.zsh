ZSH=$HOME/.zsh

for script in \
  environment \
  prompts \
  aliases \
  ruby \
  hub \
  heroku \
  functions \
  ric \
; do
  source $HOME/.zsh/$script.zsh
done
