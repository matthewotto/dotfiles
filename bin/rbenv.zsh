function rbenv-prompt-info(){

  if [[ -s .ruby-version ]] ; then 
    local ruby_version
    ruby_version=$(rbenv version 2> /dev/null) || return
    echo "$ruby_version" | sed 's/[ \t].*$//'
  else 
    return
  fi
}
