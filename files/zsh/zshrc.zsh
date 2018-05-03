# Order is significant. local should be almost last, and rbenv should be last.
scripts=(environment prompts aliases autojump functions local rbenv)

for script in "${scripts[@]}"; do
  source "$HOME/.zsh/$script.zsh"
done

# fzf won't stop doing this, so I guess I'll stop fighting it.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vi: set ft=sh:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
