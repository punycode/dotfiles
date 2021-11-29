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

# Ruby gems in $HOME
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# Google Go
export GOPATH=$HOME/Projects/Go
export PATH=$GOPATH/bin:$PATH

# OS-specific parts (exports)
case `uname -s` in
*BSD|Darwin)
  # Set Java version to use
  export JAVA_HOME=`/usr/libexec/java_home -d64 -v11\*`
  export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-21.2.0
  # Python stuff
  export PATH="/usr/local/opt/python@3.8/libexec/bin:$PATH"
  export PATH="/usr/local/opt/python@3.8/bin:$PATH"
  export PATH="${HOME}/Library/Python/3.8/bin:$PATH"
  ;;
esac

# Device-local profile settings
if [ -f "${HOME}/.profile.local" ]; then
  source "${HOME}/.profile.local"
fi

# Secrets from environment variables
if [ -f "${HOME}/.profile.secrets" ]; then
  source "${HOME}/.profile.secrets"
fi

if false; then
complete -C /usr/local/bin/mc mc
fi

# Kubectl plugin manager
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
