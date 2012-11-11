setopt menucomplete
setopt prompt_subst

autoload -U colors && colors
autoload -U compinit && compinit

source ~/bin/.aliases.sh

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
#RVM
if [[ -s /Users/Matt/.rvm/scripts/rvm ]] ; then source /Users/Matt/.rvm/scripts/rvm ; fi

precmd () {print -Pn "\e]0;%n@%M: %~\a"}

PROMPT='
%{$fg[yellow]%}%~%{$reset_color%}
∴'
RPROMPT='%{$fg[magenta]%} $(~/.rvm/bin/rvm-prompt)%{$reset_color%}$(~/bin/git-cwd-info.rb)%{$reset_color%}'

__rvm_project_rvmrc
#define_vim_wrappers
fpath=(/usr/local/share/zsh-completions $fpath)
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
