# Enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
# ...
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options.
export HISTCONTROL=ignoredups:erasedups
# Keep a larger Bash history.
export HISTSIZE=100000
export HISTFILESIZE=100000

# Append to the Bash history file, don't overwrite it.
shopt -s histappend

# Check the terminal window size after each command and, if necessary,
#   update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
#   match all files and zero or more directories and subdirectories.
#shopt -s globstar

export PATH="/opt/homebrew/bin:$PATH"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export EDITOR=nvim
export KUBE_EDITOR=nvim

source <(kind completion bash)
source <(kubectl completion bash)
source <(helm completion bash)
source <(skaffold completion bash)

alias k=kubectl

complete -F __start_kubectl k

# Loads completion suggestions for the `task` tool.
eval "$(task --completion bash)"

# Neovim:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm.
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion.

# More aliases:
alias ping=gping

. "$HOME/.cargo/env"

# Activate Starship for shell prompt.
eval "$(starship init bash)"

# Include brew in PATH.
eval "$(brew shellenv)"

# fdf (fuzzy finder) settings bellow:
#
# Enable fuzzy finder's shell features.
eval "$(fzf --bash)"
#
# Use "fd" instead of "fzf".
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
#
# Use "fd" for listing path candidates.
# - The first argument (${1}) is the base path to start traversal.
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git "${1}"
}
#
# Use "fd" to generate the list for directory completion.
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git "${1}"
}
#
# Load extra fzf-based features for the shell git command.
source ~/fzf-git.sh/fzf-git.sh
#
# Improve preview screens.
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --icons=always --color=always {} | head -n 200'"
#
# Advanced customization of "fzf" options via "_fzf_comprun" function.
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to "fzf".
_fzf_comprun() {
  local command="${1}"
  shift

  case "${command}" in
  cd) fzf --preview "eza --tree --icons=always --color=always {} | head -n 200" "${@}" ;;
  export | unset) fzf --preview "eval 'echo \$' {}" "${@}" ;;
  ssh) fzf --preview "dig {}" "${@}" ;;
  *) fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "${@}" ;;
  esac
}
#
# ~ end of fzf customization.

# "bat" command theme.
export BAT_THEME="Catppuccin Macchiato"

# "eza" (better "ls").
alias ls="eza --color=always --long --icons=always"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
