#!/bin/bash

user_name=$(git config user.name)
initials=$(echo $user_name | awk '{print tolower(substr($1,1,1)) tolower(substr($2,1,1))}')

if [ "$1" = "--all" ]; then
  git for-each-ref --color=always --sort=-committerdate --format='%(color:cyan)%(committerdate:short)%(color:reset) %(color:yellow)%(refname:short)%(color:reset)' "refs/heads/$initials/**"
else
  git for-each-ref --color=always --sort=-committerdate --format='%(color:cyan)%(committerdate:short)%(color:reset) %(color:yellow)%(refname:short)%(color:reset)' "refs/heads/$initials/**" | head -n 10
fi
