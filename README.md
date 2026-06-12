# Mandate

A template for AI-assisted software projects.

Clone this repo to get a working agent development environment with
conventions, contracts, and CI already in place.

## Building with Mandate + OpenSpec

1. **Start here:** [docs/START.md](docs/START.md)
2. **Environment:** [docs/dev-environment.md](docs/dev-environment.md)
3. **New project:** `./scripts/init-project.sh`
4. **Agent commands:** `/opsx:propose`, `/opsx:apply`, `/opsx:archive`

Active work is tracked in `openspec/changes/<name>/tasks.md` (see `openspec/ACTIVE_CHANGE`).

---

## What's Included

| File/Folder | Purpose |
|---|---|
| `SOUL.md` | Axel's persona — read this first in every session |
| `AGENTS.md` | Mechanical contract: branches, commits, PR gate, failure policy |
| `openspec/` | Spec-driven development layer (proposals, tasks, changes) |
| `.github/workflows/` | Conditional CI — lint and tests, gated on file existence |
| `.cursor/rules/mandate.mdc` | Cursor agent rules |
| `.githooks/pre-push` | Blocks direct pushes to main |
| `docs/` | Autonomy levels, rollback playbook, decision log |

---

## Setup After Cloning

```bash
./scripts/setup-git-hooks.sh
```

For a new product repo cloned from this template, run `./scripts/init-project.sh` once.
See [docs/START.md](docs/START.md) for the full CAPTURE → SHIP workflow.

---

## Adding Your Stack

Mandate has no fixed language or framework. When you add code:

1. Add lint config (`.yamllint`, `.markdownlint.json`) — CI picks it up automatically
2. Add a test runner config (`package.json`, `pytest.ini`, `go.mod`, etc.)
   and configure `.github/workflows/tests.yml` for your stack
3. Update `openspec/config.yaml` with your project context

---

## Workflow

**CAPTURE** — Define the work. Fill out a Capture Brief in `openspec/storms/`.  
**SHIP** — Build it. One file at a time. Human approves before Axel moves on.
