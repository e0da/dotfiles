if uname -a | grep Microsoft >/dev/null 2>&1; then
  # Make job control (&, bg, fg) work well in Windows
  # https://github.com/Microsoft/WSL/issues/1887
  unsetopt BG_NICE

  # Make terminal not corrupt into insanity using Vim in Windows-y consoles
  export TERM=xterm-color
fi

