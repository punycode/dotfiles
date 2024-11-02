# .profile (multi-platform)

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# OS-specific parts (aliases)
case `uname -s` in
Linux)
  alias ls="ls --color=auto"
  ;;
*BSD|Darwin)
  alias ls="ls -G"
  ;;
esac

alias l="ls -l"
alias la="ls -lhAF"
alias ll="ls -lhF"
alias lt="ls -lhtrF"
alias l.="ls -lhtrdF .*"

# Use english locales by default
export LANG=en_US.UTF-8
export LC_ALL="${LANG}"

# Default editor
export EDITOR=vim

# Something LESS
export LESS="-F -X $LESS"

# Google Go
export GOPATH=$HOME/Projects/Go
export PATH=$GOPATH/bin:$PATH

# Device-local profile settings
if [ -f "${HOME}/.profile.local" ]; then
  source "${HOME}/.profile.local"
fi

# Secrets from environment variables
if [ -f "${HOME}/.profile.secrets" ]; then
  source "${HOME}/.profile.secrets"
fi

# Kubectl plugin manager
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Add some often used shortcut functions to BC
export BC_ENV_ARGS="-l $HOME/.bcrc"
