#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: do-git-commit.sh c <type> <subject> <description>"
  exit 1
fi
# get ticket number from branch name
ticketNum=$(git rev-parse --abbrev-ref HEAD  | cut -d '/' -f2)
git commit -m "[$ticketNum]$1($2): $3" --no-verify