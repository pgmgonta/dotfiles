PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#history setting
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt hist_ignore_dups

#command autocomplete
autoload -Uz compinit
compinit

#enter the directory name then run automatically cd command.
setopt auto_cd
