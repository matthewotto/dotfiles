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
source ~/.git-completion.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export LSCOLORS=Dxfxcxdxbxegedabagacad
PS1='\n\h: \[\e[33m\]\w\n\[\e[37;40m\]$(__git_ps1 "(%s)")\[\e[32m\]➜ \[\e[0m\]'
if [[ -s /Users/Matt/.rvm/scripts/rvm ]] ; then source /Users/Matt/.rvm/scripts/rvm ; fi
mkcd () {
 mkdir -p "$*"
 cd "$*"
}

