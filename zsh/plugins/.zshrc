zstyle ':znap:*' repos-dir ~/.zshplugs
source ~/zsh-snap/znap.zsh

#!/bin/zsh

# +------------+
# | STARTUP |
# +------------+
fpath=($ZDOTDIR $fpath)
source $XDG_CONFIG_HOME/aliases/aliases
# +------------+
# | NAVIGATION |
# +------------+
setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
#source $ZDOTDIR/bd.zsh

#autoload -Uz bd; 

# +---------+
# | HISTORY |
# +---------+
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# +--------+
# | COLORS |
# +--------+
#PS1=$'%{\e['$zcolor[di]$'m%}%~%{\e[m%}/ %# '

znap source marlonrichert/zcolors
znap eval zcolors "zcolors ${(q)LS_COLORS}"


# +-----------+
# | PROFILING |
# +-----------+


# +------------+
# | COMPLETION |
# +------------+
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#znap source zsh-users/zsh-completions
#fpath=($ZDOTDIR/zsh-completions/src $fpath)
znap source marlonrichert/zsh-autocomplete

znap source zsh-users/zsh-autosuggestions
#source $ZDOTDIR/prezto_pruned_completion.zsh
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

## source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh [SWITCH TO ZNAP]

# +---------------------+
# | SYNTAX HIGHLIGHTING |
# +---------------------+
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
zmodload zsh/zprof

#source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh [SWITCH TO ZNAP]
#source $ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh [SWITCH TO ZNAP]

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

znap eval starship 'starship init zsh --print-full-init'
znap prompt
