#!/usr/bin/env bash
# Enable Mandate .githooks for this repository (local config only).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [[ ! -f .githooks/pre-push ]]; then
  echo "Missing .githooks/pre-push"
  exit 1
fi

chmod +x .githooks/pre-push
git config core.hooksPath .githooks

# Normalize CRLF if present (legacy Windows checkout)
if command -v sed >/dev/null 2>&1; then
  sed -i 's/\r$//' .githooks/pre-push 2>/dev/null || sed -i '' 's/\r$//' .githooks/pre-push
fi

echo "Git hooks enabled: core.hooksPath=.githooks"
echo "Pre-push blocks updates to refs/heads/main only."
