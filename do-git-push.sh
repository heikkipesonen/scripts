#!/bin/bash


# get ticket number from branch name
branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$1" == "f" ]; then
  git push --force-with-lease
  exit 0
fi

# Check if branch has upstream tracking
if git rev-parse --abbrev-ref --symbolic-full-name @{u} > /dev/null 2>&1; then
  # Branch has upstream, push normally
  git push
else
  # New branch, push with -u to set upstream
  git push -u origin $branch
fi
