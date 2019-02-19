alias ls='ls -aG'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gbr='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias drop='open ~/Dropbox'
alias migrate='rake db:migrate && rake db:test:prepare'
alias dl='osascript /usr/local/bin/dock_left.scpt'
alias db='osascript /usr/local/bin/dock_bottom.scpt'
alias latest='ls -ltU | head'
alias please='sudo'
alias mkgemset='rvm gemset create ${PWD##*/} && new_rvmrc && pushd .. && rvm use default && popd'
alias new_rvmrc='rvm rvmrc create $(~/.rvm/bin/rvm-prompt)@${PWD##*/} --ruby-version'
alias tmux='TERM=screen-256color-bce tmux'
alias gems-kill='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias gems-clean='gems-kill && gem install bundler -v 1.1.4 && gem install rake pivotal_git_scripts'
alias dos2unix="perl -npe 's/\x0D/\x0A/g' "
alias r='rails'
alias diskspace="du -k | grep -v './.*\/' | sort -n"
alias be='bundle exec'
alias msqlq='mysql.server stop'
alias msqls='mysql.server start'
alias pgs='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgq='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias xcode="xcode-select -p | sed 's/\/Contents\/Developer//' | xargs open"
alias branchname="git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy"
alias cat=bat

# Colour constants for nicer output.
GREEN='\033[0;32m'
RESET='\033[0m'

# Push the current branch to origin, set upstream, open the PR page if possible.
pr() {
    # Get the current branch name, or use 'HEAD' if we cannot get it.
    branch=$(git symbolic-ref -q HEAD)
    branch=${branch##refs/heads/}
    branch=${branch:-HEAD}

    # Pushing take a little while, so let the user know we're working.
    echo -e "Opening pull request for ${GREEN}${branch}${RESET}..."

    # Push to origin, grabbing the output but then echoing it back.
    push_output=`git push origin -u ${branch} 2>&1`
    echo ""
    echo -e "${push_output}"

    # If there's anything which starts with http, it's a good guess it'll be a
    # link to GitHub/GitLab/Whatever. So open it.
    link=$(echo "${push_output}" | grep -o 'http.*' | sed -e 's/[[:space:]]*$//')
    if [ "${link}" ]; then
        echo ""
        echo -e "Opening: ${GREEN}${link}${RESET}..."
        open ${link}
    fi
}
