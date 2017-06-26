# Order is significant. local should be almost last, and rbenv should be last.
scripts=(environment prompts aliases autojump functions local rbenv)

for script in "${scripts[@]}"; do
  source "$HOME/.zsh/$script.zsh"
done

# fzf won't stop doing this, so I guess I'll stop fighting it.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vi: set ft=sh:
