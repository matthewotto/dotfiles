alias ls='ls -aG'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gbr='git branch'
alias gco='git checkout'
alias gd='git diff'
source ~/.git-completion.sh
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
