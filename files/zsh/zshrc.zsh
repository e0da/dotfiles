# Order is significant. local should be last
scripts=(environment command-not-found prompts aliases autojump functions local)

for script in "${scripts[@]}"; do
  source "$HOME/.zsh/$script.zsh"
done

# This is all stuff that keeps getting shoved into or suggested for this file.
# It's less work to just leave them here than to fight it.

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python
export PATH="/home/force/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# vi: set ft=sh:
