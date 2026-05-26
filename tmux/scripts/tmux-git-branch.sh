#!/usr/bin/env bash
# ~/.tmux/scripts/tmux-git-branch

path="$1"
cd "$path" 2>/dev/null || exit 0

short_path="${path/#$HOME/\~}"

branch=$(git symbolic-ref --short HEAD 2>/dev/null) \
  || branch=$(git rev-parse --short HEAD 2>/dev/null | sed 's/.*/(detached) &/')

output="$short_path"
[[ -n "$branch" ]] && output+=" [$branch]"
echo "$output"
