#!/usr/bin/env bash
set -euCET -o pipefail

case "${INPUT_TARGET:-}" in
  repository)
    API_URL="repos/${GITHUB_REPOSITORY}/interaction-limits"
    ;;
  organization)
    API_URL="orgs/${GITHUB_REPOSITORY_OWNER}/interaction-limits"
    ;;
  user)
    API_URL="user/interaction-limits"
    ;;
esac

echo "API_URL=${API_URL}" >> "${GITHUB_ENV}"
