#!/usr/bin/env bash

# The script will add/remove keys (based on .sops.yaml) in all encrypted sops.

set -o errexit

find . \( -type f -name '*.enc.yaml' -or -name '*.enc.json' \) -print0 | while IFS= read -r -d $'\0' file; do
  echo "INFO - Update keys for: $file"
  sops updatekeys "$file" --yes
done
