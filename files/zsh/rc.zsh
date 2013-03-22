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

[ -f $HOME/.zlocal ] && source $HOME/.zlocal # secret shit that can't be source controlled
