#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: do-git-commit.sh c <type> <subject> <description>"
  exit 1
fi

# get ticket number from branch name
branch=$(git rev-parse --abbrev-ref HEAD)

# Try to extract ticket number from branch
# Assumes format like initials/TICKET-123/desc or TICKET-123/desc or feature/TICKET-123
if [[ "$branch" == *"/"* ]]; then
  # Branch has slashes, try to find ticket in second or first segment
  first_segment=$(echo "$branch" | cut -d '/' -f1)
  second_segment=$(echo "$branch" | cut -d '/' -f2)
  
  if [[ "$second_segment" =~ ^[A-Z]+-[0-9]+$ ]]; then
    ticketNum="$second_segment"
  elif [[ "$first_segment" =~ ^[A-Z]+-[0-9]+$ ]]; then
    ticketNum="$first_segment"
  else
    ticketNum=""
  fi
else
  ticketNum=""
fi

# Check if we found a valid ticket number
if [[ -n "$ticketNum" ]]; then
  git commit -m "[$ticketNum]$1($2): $3" --no-verify
else
  git commit -m "$1($2): $3" --no-verify
fi