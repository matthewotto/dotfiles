source ~/.aliases.sh
source ~/.git-completion.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWSTASHSTATE=true

#RVM
if [[ -s /Users/Matt/.rvm/scripts/rvm ]] ; then source /Users/Matt/.rvm/scripts/rvm ; fi

#export LSCOLORS="exfxcxdxbxegedabagacad"
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

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
