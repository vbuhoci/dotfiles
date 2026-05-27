# Bash completion setup

OS=$(uname)

# Enable bash completion if available
if [[ "${OS}" == "Linux" ]]; then
  if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
  fi
elif [[ "${OS}" == "Darwin" ]]; then
  if [[ -s $HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh ]]; then
    . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
  fi
fi

# Docker completions
if [ -d "$HOME/.docker/completions" ]; then
  for completion in "$HOME/.docker/completions"/*; do
    if [ -f "$completion" ]; then
      . "$completion"
    fi
  done
fi
export PATH="$HOME/.local/bin:$PATH"
