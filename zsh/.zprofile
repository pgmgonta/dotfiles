# MacPorts Installer addition on 2012-03-04_at_15:43:27: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/usr/local/bin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:${DYLD_LIBRARY_PATH}
export PS1="$ "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias ls='ls -la'
alias be='bundle exec'
alias g='git'

