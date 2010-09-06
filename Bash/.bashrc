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
source ~/.git-completion.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export LSCOLORS=Dxfxcxdxbxegedabagacad
if [[ -s /Users/Matt/.rvm/scripts/rvm ]] ; then source /Users/Matt/.rvm/scripts/rvm ; fi
PS1='\n\h: \[\e[33m\]\w\n\[\e[37;40m\]$(__git_ps1 "(%s)")\[\e[32m\]➜ \[\e[0m\]'
PS1="\[\e]0;\w\a\]$PS1"
#PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"
#PS1="\033]0;\w\007\w"
mkcd () {
 mkdir -p "$*"
 cd "$*"
}

