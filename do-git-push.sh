#!/bin/bash


# get ticket number from branch name
branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$1" == "f" ]; then
  git push origin $branch --force-with-lease
  exit 0
fi

git push origin $branch
