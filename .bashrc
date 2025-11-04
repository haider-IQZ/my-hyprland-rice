#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Run fastfetch on shell initialization
fastfetch
. "$HOME/.cargo/env"

# FZF configuration
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# FZF options
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "bat --color=always --style=numbers --line-range=:500 {}"'

# Fuzzy file finder alias (like Omarchy)
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" | xargs -r nvim'
