alias ls='ls -aGF'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gbr='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias ss='./script/server'
alias sc='./script/console'
alias v='mvim'
alias rvmrc="echo 'rvm use $1' > .rvmrc"
alias devdir="cd /Development"
alias drop="open ~/Dropbox"
alias migrate='rake db:migrate && rake db:test:prepare'
alias dl='osascript /usr/local/bin/dock_left.scpt'
alias db='osascript /usr/local/bin/dock_bottom.scpt'
alias latest='ls -ltU | head'

source ~/.git-completion.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWSTASHSTATE=true
export LSCOLORS=Dxfxcxdxbxegedabagacad

if [[ -s /Users/Matt/.rvm/scripts/rvm ]] ; then source /Users/Matt/.rvm/scripts/rvm ; fi

export LSCOLORS="exfxcxdxbxegedabagacad"

mkcd () {
 mkdir -p "$*"
 cd "$*"
}

function pprom {
  local         BLUE="\[\033[0;34m\]"
  local        BROWN="\[\033[0;33m\]"
  local         CYAN="\[\033[0;36m\]"
  local         GRAY="\[\033[1:30m\]"
  local        GREEN="\[\033[0;32m\]"
  local       PURPLE="\[\033[0;35m\]"
  local          RED="\[\033[0;31m\]"
  local       YELLOW="\[\033[1;33m\]"
  local        WHITE="\[\033[1;37m\]"
  local   LIGHT_BLUE="\[\033[1;34m\]"
  local   LIGHT_CYAN="\[\033[1;36m\]"
  local   LIGHT_GRAY="\[\033[0;37m\]"
  local  LIGHT_GREEN="\[\033[1;32m\]"
  local LIGHT_PURPLE="\[\033[1:35m\]"
  local    LIGHT_RED="\[\033[1;31m\]"
  local       NO_COLOUR="\[\033[0m\]"

  
  case $TERM in
      xterm*)
          TITLEBAR='\[\033]0;\u@\h:\w\007\]'
          ;;
      *)
          TITLEBAR=""
          ;;
  esac
PS1="$TITLEBAR\\n$BROWN\w\n$PURPLE\$(~/.rvm/bin/rvm-prompt)$WHITE\$(__git_ps1 ' (%s)')$NO_COLOUR ➜ "
PS2='> '
PS4='+ '


}
pprom
