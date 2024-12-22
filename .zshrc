# An oh-my-zsh (https://ohmyz.sh) based ZSH configuration

export ZSH="$HOME/.oh-my-zsh"

# ZSH settings, which need to be specified before loading oh-my-zsh

# Theme to load on start (needs to be present in $ZSH_CUSTOM)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Use case sensitive completion (default: false)
CASE_SENSITIVE="true"

# Update mode for oh-my-zsh (one of disabled, auto or reminder)
zstyle ':omz:update' mode reminder

# Check/remind every x days
zstyle ':omz:update' frequency 13

# Enable history timestamps in ZSH
HIST_STAMPS="yyyy-mm-dd"

# We store our custom ZSH config files in this dot directory
ZSH_CUSTOM="${HOME}/.zsh"

# Oh my ZSH enabled plugins
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(fzf brew)

# Finally initialize Oh My ZSH
source $ZSH/oh-my-zsh.sh

# User configuration (e.g. not managed by Oh my ZSH)

# The powerlevel10k scheme needs additional configuration sourced
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source the default shell profile
source ~/.profile

# Configuration for ZSH history
export HISTSIZE=500000
export SAVEHIST=500000
setopt extended_history          # Write the history file in the ":start:elapsed;command" format.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
setopt hist_save_no_dups         # Don't write duplicate entries in the history file.
setopt hist_reduce_blanks        # Remove superfluous blanks before recording entry.
setopt hist_verify               # Don't execute immediately upon history expansion.
setopt hist_beep                 # Beep when accessing nonexistent history.

# Other ZSH settings
setopt emacs                     # Use EMACS keybindings for input navigation
setopt extended_glob             # Extended globbing behaviour
