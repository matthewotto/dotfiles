alias ls='ls -aG'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gbr='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias devdir="cd /Development"
alias drop="open ~/Dropbox"
alias migrate='rake db:migrate && rake db:test:prepare'
alias dl='osascript /usr/local/bin/dock_left.scpt'
alias db='osascript /usr/local/bin/dock_bottom.scpt'
alias latest='ls -ltU | head'
alias please='sudo'
alias mkgemset='rvm gemset create ${PWD##*/}'
alias rvmrc='echo rvm use $(~/.rvm/bin/rvm-prompt)@${PWD##*/} > .rvmrc'
alias tmux="TERM=screen-256color-bce tmux"
