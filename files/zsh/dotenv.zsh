# Lifted from oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh/blob/b7b40b0b68c791d57d91c7f4e17ed681d01d5c75/plugins/dotenv/dotenv.plugin.zsh

source_env() {
  if [[ -f .env ]]; then
    # test .env syntax
    zsh -fn .env || echo 'dotenv: error when sourcing `.env` file' >&2

    if [[ -o a ]]; then
      source .env
    else
      set -a
      source .env
      set +a
    fi
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd source_env

source_env
