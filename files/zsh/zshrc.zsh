# Order is significant. local should be almost last, and rbenv should be last.
scripts=(environment prompts aliases autojump functions fzf local rbenv)

for script in "${scripts[@]}"; do
  source "$HOME/.zsh/$script.zsh"
done

# vi: set ft=sh:
