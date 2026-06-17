#!/usr/bin/env bash
set -euCET -o pipefail

if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "::error::'env.TOKEN' ; Actual: '${GITHUB_TOKEN:-}' ; Expected: Non-Null String"
  exit 1
fi

if [ -n "${INPUT_SCOPE:-}" ]; then
  case "${INPUT_SCOPE}" in
    existing_users|contributors_only|collaborators_only)
      ;; # valid
    *)
      echo "::error::'inputs.scope' ; Actual: '${INPUT_SCOPE}' ; Expected: 'existing_users' | 'contributors_only' | 'collaborators_only'"
      exit 1
      ;;
  esac
fi

case "${INPUT_TARGET:-}" in
  repository|organization|user)
    ;; # valid
  *)
    echo "::error::'inputs.target' ; Actual: '${INPUT_TARGET:-}' ; Expected: 'repository' | 'organization' | 'user'"
    exit 1
    ;;
esac
