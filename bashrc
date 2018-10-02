set -o vi

source $HOME/bin/aliases.sh
source $HOME/bin/git-completion.sh
private_path=$HOME/dotfiles-local/private.local
test -r $private_path && . $private_path

gem_local=$HOME/dotfiles-local/gemrc.local
test -r $gem_local && export GEMRC=$gem_local

export CLICOLOR=1
export TERM=xterm-256color

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWSTASHSTATE=true


export LSCOLORS="exfxcxdxbxegedabagacad"
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
  if [[ -z "$SSH_CLIENT" ]]; then
    prompt_host=""
  else
    # prompt_host=%{$fg_bold[white]%}@%{$reset_color$fg[yellow]%}$(hostname -s)
    prompt_host="$LIGHT_RED\h "
  fi
PS1="$TITLEBAR\\n$prompt_host$BROWN\w\n$PURPLE\$WHITE\$(__git_ps1 ' (%s)')$NO_COLOUR ➜ "
PS2='> '
PS4='+ '

}
pprom

export PATH="$PATH:$HOME/bin" # Add ~/bin to path for scripting
