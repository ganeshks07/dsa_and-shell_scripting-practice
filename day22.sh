#!/usr/bin/env bash
# Shell #18 - Bulk-fetch all params under a path into a .env file
# Usage: ./ssm_to_env.sh /myapp/prod > prod.env
set -euo pipefail

PREFIX="${1:?Usage: ssm_to_env.sh /path/prefix}"

aws ssm get-parameters-by-path \
  --path "$PREFIX" \
  --recursive \
  --with-decryption \
  --query 'Parameters[].[Name,Value]' \
  --output text \
  | while IFS=$'\t' read -r name value; do
        # /myapp/prod/DB_HOST  ->  DB_HOST=value
        key=$(basename "$name")
        echo "${key}=${value}"
    done
