# Mandate + OpenSpec — improvement checklist

Use this when evolving the Mandate template repo.

## Philosophy

- [ ] Document: **no app feature on `main` without a driving `tasks.md`**
- [ ] CAPTURE produces a storm brief; SHIP consumes an OpenSpec change
- [ ] Archive completed changes so `openspec/specs/` becomes the living library

## Onboarding

- [ ] `docs/START.md` is linked from root README
- [ ] `scripts/init-project.sh` sets project name + `ACTIVE_CHANGE`
- [ ] `openspec/config.yaml.example` → copied to `config.yaml` per project
- [ ] Example change `openspec/changes/example-starter/` ships with the template

## Agent contract

- [ ] `AGENTS.md` references `openspec/ACTIVE_CHANGE` and `tasks.md`
- [ ] Session start forbids greenfield code without active change
- [ ] Branch naming: `ship/<change-name>` aligned with OpenSpec change id

## Capture → OpenSpec handoff

- [ ] `CAPTURE_BRIEF_TEMPLATE.md` includes OpenSpec change name + next command
- [ ] Optional: `scripts/openspec-from-capture.sh` prints next steps

## Tooling hygiene

- [ ] `.gitattributes` forces LF on `*.sh` and `.githooks/*`
- [ ] `pre-push` blocks `refs/heads/main` only (not all pushes from main)
- [ ] `scripts/setup-git-hooks.sh` documented in START.md

## CI

- [ ] `openspec-status.yml` runs when `openspec/` changes (if CLI available)
- [ ] App test workflow stays conditional on `package.json`

## Distribution

- [ ] Do **not** treat `.cursor` / `.claude` / `.gemini` / `.opencode` as source of truth (see `docs/ide-agnostic.md`)

## Retrofit path (brownfield)

Document for teams who coded first:

1. `openspec new change <name>`
2. Write artifacts; mark done tasks `[x]`
3. Continue applying remaining tasks in `tasks.md`
