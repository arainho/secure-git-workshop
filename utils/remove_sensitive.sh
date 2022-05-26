#!/usr/bin/env bash

if [[ "$1" != "-f" ]]
then
        echo "usage: $0 -f file_with_sensitive_data"
        exit 1
fi

while getopts "f" flag; do
  case "${flag}" in
  f) FILE_WITH_SENSITIVE_DATA=$OPTARG ;;
  *) echo "usage: $0 -f file_with_sensitive_data"
     exit 1;;
  esac
done

git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch ${FILE_WITH_SENSITIVE_DATA}" \
  --prune-empty --tag-name-filter cat -- --all
