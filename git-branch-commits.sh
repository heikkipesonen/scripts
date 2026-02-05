#!/bin/bash
git --no-pager log origin/main..HEAD --no-merges --cherry-pick --right-only --color=always --pretty=format:'%C(cyan)[%an]%C(reset) %C(yellow)%s%C(reset)'
echo ""
echo "Total commits: $(git log origin/main..HEAD --no-merges --cherry-pick --right-only --oneline | wc -l | tr -d ' ')"
