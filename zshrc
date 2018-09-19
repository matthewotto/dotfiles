setopt menucomplete
setopt prompt_subst

autoload -U colors && colors
autoload -U compinit && compinit

export EDITOR=vim
export RAILS_ENV=development
export PATH=$PATH:/usr/X11/bin

# History
# number of lines kept in history
export HISTSIZE=1000
# number of lines saved in the history after logout
export SAVEHIST=1000
# location of history
export HISTFILE=~/.zhistory
#  append command to history file once executed
setopt inc_append_history

export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS="exfxcxdxbxegedabagacad"

source ~/bin/aliases.sh
#source ~/bin/rbenv.zsh

mkcd () {
 mkdir -p "$*"
 cd "$*"
}


# Define Vim wrappers which unsets GEM_HOME and GEM_PATH before
# invoking vim and all known aliases
#
# @author Wael Nasreddine <wael.nasreddine@gmail.com>
function define_vim_wrappers()
{
    vim_commands=(
        eview evim gview gvim gvimdiff gvimtutor rgview
        gvim rview rvim vim vimdiff vimtutor xxd mvim
    )

    for cmd in ${vim_commands[@]}; do
      cmd_path=`/usr/bin/env which -a "${cmd}" 2>/dev/null | grep '^/'`
      if [ -x "${cmd_path}" ]; then
        eval "function ${cmd} () { (unset GEM_HOME; unset GEM_PATH; $cmd_path \$@) }"
      fi
    done
}

precmd () {print -Pn "\e]0;%n@%M: %~\a"}

PROMPT='
%{$fg[yellow]%}%~%{$reset_color%}
∴ '

#RVM
#if [[ -s /Users/Matt/.rvm/scripts/rvm ]] ; then source /Users/Matt/.rvm/scripts/rvm ; fi
#RPROMPT='%{$fg[magenta]%} $(~/.rvm/bin/rvm-prompt)%{$reset_color%}$(~/bin/git-cwd-info.rb)%{$reset_color%}'

#RBENV
source ~/bin/rbenv.zsh
RPROMPT='%{$fg[magenta]%} $(rbenv-prompt-info)%{$reset_color%}$(~/bin/git-cwd-info.rb)%{$reset_color%}'

#__rvm_project_rvmrc
#define_vim_wrappers
fpath=(/usr/local/share/zsh-completions $fpath)
#export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# added by travis gem
#source /Users/m.otto/.travis/travis.sh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
