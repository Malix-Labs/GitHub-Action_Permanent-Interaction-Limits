#!/usr/bin/env bash
set -euCET -o pipefail

gh api \
  --header "X-GitHub-Api-Version: 2022-11-28" \
  --header "Accept: application/vnd.github+json" \
  "${API_URL}" \
  --method PUT \
  --field "limit=${LIMIT_TO_SET}" \
  --field "expiry=six_months"
