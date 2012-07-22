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
zstyle ':completion:*' list-colors ''

#enter the directory name then run automatically cd command.
setopt auto_cd

autoload -Uz colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd(){
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

prompt_bar_left_self="[%{%F{cyan}%}%{%B%}%n%{%b%}%{%f%}]"
prompt_bar_left_status="%{%B%F{white}%(?.%K{green}.%K{red})%}%?%{%k%f%b%}"
prompt_bar_left_date="%{%B%}%D{%Y/%m/%d %H:%M}%{%b%}"
prompt_bar_left_current="[%{%B%K{magenta}%F{white}%}%d%{%f%k%b%}]"
prompt_bar_vcs="%1(v|%F{green}%1v%f|)"
prompt_bar_left="${prompt_bar_left_self} ${prompt_bar_left_date} ${prompt_bar_left_status} ${prompt_bar_vcs} ${prompt_bar_left_current} "
prompt_left=";-) %(1j,(%j),)%{%B%}%#%{%b%} "

PROMPT="${prompt_bar_left}"$'\n'"${prompt_left}"

