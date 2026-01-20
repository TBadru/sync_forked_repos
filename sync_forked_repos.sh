#!/usr/bin/env bash
set -euo pipefail

echo "Fetching all forked repositories..."

mapfile -t FORKS < <(
  gh repo list --limit 1000 --json nameWithOwner,isFork \
  | jq -r '.[] | select(.isFork == true) | .nameWithOwner'
)

if [[ ${#FORKS[@]} -eq 0 ]]; then
  echo "No forks found."
  exit 0
fi

for FORK in "${FORKS[@]}"; do
  echo "----------------------------------------"
  echo "Syncing fork: $FORK"

  # Server-side sync (default branch only)
  gh repo sync "$FORK" --force || {
    echo "⚠️  Failed to sync $FORK"
    continue
  }
done

echo "----------------------------------------"
echo "All forks synced."
