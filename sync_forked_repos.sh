#!/bin/sh
set -eu

echo "Fetching all forked repositories..."

FORKS=$(gh repo list --limit 1000 --json nameWithOwner,isFork \
  | jq -r '.[] | select(.isFork == true) | .nameWithOwner')

if [ -z "$FORKS" ]; then
  echo "No forks found."
  exit 0
fi

echo "$FORKS" | while IFS= read -r FORK; do
  echo "----------------------------------------"
  echo "Syncing fork: $FORK"

  # Server-side sync (default branch only)
  if ! gh repo sync "$FORK" --force; then
    echo "⚠️  Failed to sync $FORK"
  fi
done

echo "----------------------------------------"
echo "All forks synced."