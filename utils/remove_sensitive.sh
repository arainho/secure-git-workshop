#!/usr/bin/env bash

while getopts ":f:" flag; do
  case "${flag}" in
  f) FILE_WITH_SENSITIVE_DATA=$OPTARG ;;
  *) echo "unknown ${flag}, use $0 -f file_with_sensitive_data" ;;
  esac
done

git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch ${FILE_WITH_SENSITIVE_DATA}" \
  --prune-empty --tag-name-filter cat -- --all
