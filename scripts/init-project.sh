#!/usr/bin/env bash
# Initialize a new Mandate project for OpenSpec-driven SHIP.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "Mandate project init"
echo "===================="
read -rp "Project name (e.g. SpecRewards): " PROJECT_NAME
read -rp "One-line tagline: " PROJECT_TAGLINE
read -rp "Stack description (e.g. Next.js 15, SQLite, Drizzle): " STACK_DESCRIPTION
read -rp "First OpenSpec change name (kebab-case, e.g. mvp-foundation): " CHANGE_NAME

if [[ -z "$PROJECT_NAME" || -z "$CHANGE_NAME" ]]; then
  echo "Project name and change name are required."
  exit 1
fi

# openspec config
if [[ -f openspec/config.yaml ]]; then
  read -rp "openspec/config.yaml exists. Overwrite? [y/N] " OVERWRITE
  if [[ "${OVERWRITE,,}" != "y" ]]; then
    echo "Skipping config.yaml"
  else
    WRITE_CONFIG=1
  fi
else
  WRITE_CONFIG=1
fi

if [[ "${WRITE_CONFIG:-}" == "1" ]]; then
  sed -e "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" \
      -e "s/{{PROJECT_TAGLINE}}/$PROJECT_TAGLINE/g" \
      -e "s/{{STACK_DESCRIPTION}}/$STACK_DESCRIPTION/g" \
      -e "s/{{CHANGE_NAME}}/$CHANGE_NAME/g" \
      openspec/config.yaml.example > openspec/config.yaml
  echo "Wrote openspec/config.yaml"
fi

# active change pointer
echo "$CHANGE_NAME" > openspec/ACTIVE_CHANGE
echo "Wrote openspec/ACTIVE_CHANGE → $CHANGE_NAME"

# capture brief filename suggestion
STORM_SLUG="$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-')"
STORM_FILE="openspec/storms/${STORM_SLUG}-capture.md"
if [[ ! -f "$STORM_FILE" ]]; then
  cp openspec/storms/CAPTURE_BRIEF_TEMPLATE.md "$STORM_FILE"
  echo "Created $STORM_FILE — fill it in before /opsx:propose"
fi

# scaffold change if missing
if [[ ! -d "openspec/changes/$CHANGE_NAME" ]]; then
  if command -v openspec >/dev/null 2>&1; then
    openspec new change "$CHANGE_NAME"
    echo "Created openspec/changes/$CHANGE_NAME via openspec CLI"
  else
    mkdir -p "openspec/changes/$CHANGE_NAME"
    echo "schema: spec-driven" > "openspec/changes/$CHANGE_NAME/.openspec.yaml"
    echo "Created openspec/changes/$CHANGE_NAME (install openspec CLI, then run /opsx:propose)"
  fi
fi

./scripts/setup-git-hooks.sh 2>/dev/null || true

echo ""
echo "Next steps:"
echo "  1. Edit $STORM_FILE"
echo "  2. Run: /opsx:propose $CHANGE_NAME"
echo "  3. Approve proposal.md, then /opsx:apply on ship/$CHANGE_NAME"
echo "  See docs/START.md"
