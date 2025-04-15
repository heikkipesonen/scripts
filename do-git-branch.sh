#!/bin/bash

user_name=$(git config user.name)
initials=$(echo $user_name | awk '{print tolower(substr($1,1,1)) tolower(substr($2,1,1))}')

if [ "$#" -ne 2 ]; then
  echo "Usage: do-git-branch.sh <JIRA-TICKET> <DESCRIPTION>"
  exit 1
fi
echo "Creating branch $initials/$1/$2"
git checkout -b $initials/$1/$2
exit 0

