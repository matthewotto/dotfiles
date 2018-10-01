setopt menucomplete
setopt prompt_subst
setopt correctall
setopt hist_ignore_all_dups

autoload -U colors && colors
autoload -U compinit && compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

export EDITOR=vim
export RAILS_ENV=development
export PATH=$PATH:/usr/X11/bin

# History
# number of lines kept in history
export HISTSIZE=1000
# number of lines saved in the history after logout
export SAVEHIST=$HISTSIZE
# location of history
export HISTFILE=$HOME/.zhistory
#  append command to history file once executed
setopt inc_append_history

export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS="exfxcxdxbxegedabagacad"

source $HOME/bin/aliases.sh
private_path=$HOME/dotfiles-local/private.local
test -r $private_path && . $private_path

gem_local=$HOME/dotfiles-local/gemrc.local
test -r $gem_local && export GEMRC=$gem_local

mkcd () {
 mkdir -p "$*"
 cd "$*"
}

precmd () {print -Pn "\e]0;%n@%M: %~\a"}

PROMPT='
%{$fg[yellow]%}%~%{$reset_color%}
∴ '

source ~/bin/rbenv.zsh
RPROMPT='$(~/bin/git-cwd-info.rb)%{$reset_color%}'

fpath=(/usr/local/share/zsh-completions $fpath)
