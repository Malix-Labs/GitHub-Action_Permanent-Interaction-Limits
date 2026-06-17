#!/usr/bin/env bash
set -euCET -o pipefail

if [ -n "${INPUT_SCOPE:-}" ]; then
  LIMIT_TO_SET="${INPUT_SCOPE}"
else
  LIMIT_TO_SET="$(
    gh api \
      --header "X-GitHub-Api-Version: 2022-11-28" \
      --header "Accept: application/vnd.github+json" \
      "${API_URL}" \
      --jq .limit
  )"
fi
echo "LIMIT_TO_SET=${LIMIT_TO_SET}" >> "${GITHUB_ENV}"
