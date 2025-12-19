#!/bin/bash

user_name=$(git config user.name)
initials=$(echo $user_name | awk '{print tolower(substr($1,1,1)) tolower(substr($2,1,1))}')

if [ "$#" -eq 1 ]; then
  # Branch without ticket number
  echo "Creating branch $initials/$1"
  git checkout -b $initials/$1
elif [ "$#" -eq 2 ]; then
  # Branch with ticket number
  echo "Creating branch $initials/$1/$2"
  git checkout -b $initials/$1/$2
else
  echo "Usage: do-git-branch.sh <DESCRIPTION>"
  echo "   or: do-git-branch.sh <JIRA-TICKET> <DESCRIPTION>"
  exit 1
fi
exit 0

