#!/bin/bash

SERVICE_NAME=$1

if [ -z "$SERVICE_NAME" ]; then
  echo "Usage: make-dev-env [SERVICE_NAME]"
  exit 1
fi

SERVICE_DIR=~/Documents/voikukka/services/backend/${SERVICE_NAME}

cd ${SERVICE_DIR}

YESTERDAY=$(date -v-1d +%Y-%m-%d)
JSON_EXISTS=false
for file in __development/dev*.json; do
  [ -e "$file" ] || continue
  JSON_EXISTS=true
  FILE_DATE=$(date -r "$file" +%Y-%m-%d)
  if [ "$FILE_DATE" != "$YESTERDAY" ]; then
    read -p "Delete $file? (y/n) " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]] && rm -f "$file" || JSON_EXISTS=true
  else
    rm -f "$file"
  fi
done

if [ "$JSON_EXISTS" = true ] && [ -e __development/dev*.json ]; then
  make deploy-all-to-dev-environment
else
  make create-new-dev-environment
fi
