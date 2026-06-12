#!/usr/bin/env bash
# Print OpenSpec next steps after a capture brief is filled in.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CHANGE=""
if [[ -f openspec/ACTIVE_CHANGE ]]; then
  CHANGE="$(tr -d '[:space:]' < openspec/ACTIVE_CHANGE)"
fi

if [[ -z "$CHANGE" ]]; then
  read -rp "OpenSpec change name (kebab-case): " CHANGE
  echo "$CHANGE" > openspec/ACTIVE_CHANGE
fi

STORM_COUNT=$(find openspec/storms -name '*-capture.md' 2>/dev/null | wc -l)

echo ""
echo "CAPTURE → SHIP handoff"
echo "======================"
echo "Active change: $CHANGE"
echo "Storm briefs:  $STORM_COUNT file(s) under openspec/storms/"
echo ""
echo "1. Ensure capture brief is complete (≤3 open questions)"
echo "2. Run in agent chat:  /opsx:propose $CHANGE"
echo "3. Human approves:     openspec/changes/$CHANGE/proposal.md"
echo "4. Implement:          /opsx:apply  (branch: ship/$CHANGE)"
echo "5. When all [x]:       /opsx:archive"
echo ""
if command -v openspec >/dev/null 2>&1; then
  openspec status --change "$CHANGE" 2>/dev/null || true
else
  echo "(Install openspec CLI for status: npm i -g @fission-ai/openspec@latest)"
fi
