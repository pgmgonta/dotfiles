export LSCOLORS=exfxcxdxbxegedabagacad

export PATH=/usr/local/bin/:$PATH:/usr/local/sbin/:~/packer/bin:~/bin:~/anaconda/bin

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

  #Railsコマンド
  TMP_PRE_RAILS_CMD=`history | tail -n 1 | grep  "rails\|rake" | sed -e "s/^\\s[0-9]*//"`
  if [ -n "$TMP_PRE_RAILS_CMD" ]; then
    PRC2=$PRC1
    PRC1=$TMP_PRE_RAILS_CMD
    TMP_PRE_RAILS_CMD=""
  fi
}

prompt_bar_left_self="[%{%F{cyan}%}%{%B%}%n%{%b%}%{%f%}]"
prompt_bar_left_status="%{%B%F{white}%(?.%K{green}.%K{red})%}%?%{%k%f%b%}"
prompt_bar_left_date="%{%B%}%D{%Y/%m/%d %H:%M}%{%b%}"
prompt_bar_left_current="[%{%B%K{magenta}%F{white}%}%d%{%f%k%b%}]"
prompt_bar_vcs="%1(v|%F{green}%1v%f|)"
prompt_bar_left="${prompt_bar_left_self} ${prompt_bar_left_date} ${prompt_bar_left_status} ${prompt_bar_vcs} ${prompt_bar_left_current} "
prompt_left="(=°ω°)ﾉ %(1j,(%j),)%{%B%}%#%{%b%} "

PROMPT="${prompt_bar_left}"$'\n'"${prompt_left}"

#alias ls='ls -laG'
alias ll='ls -laG'
alias be='bundle exec'
alias g='git'
alias cls='clear'
alias jrails='jruby -S rails '
alias bjrails='bundle exec jruby -X-C --client -S rails '
alias bjrake='bundle exec jruby -X-C --client -S rake '
alias rm='rm -i'
alias sencha='/Users/tatsuya/bin/Sencha/Cmd/3.1.1.274/sencha --sdk-path /Applications/SenchaSDKTools-2.0.0-beta3/'

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export EDITOR=vim
export PATH=$PATH:~/bin/maven/bin/

export PATH=$PATH:/Applications/VMware\ OVF\ Tool/

export SBT_OPTS="-Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=384M"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/tatsuya/.sdkman"
[[ -s "/Users/tatsuya/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/tatsuya/.sdkman/bin/sdkman-init.sh"

eval "$(pyenv virtualenv-init -)"

