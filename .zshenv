#!/bin/zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export TERM='rxvt-256color'

# XDG
#export ZX="$HOME/zx"
export XDG_CONFIG_HOME="$HOME/dotfiles"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export XDG_STATE_HOME="$XDG_CONFIG_HOME/local/state"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
