#!/bin/bash

user_name=$(git config user.name)
initials=$(echo $user_name | awk '{print tolower(substr($1,1,1)) tolower(substr($2,1,1))}')

git branch --list "$initials/*" | cat
