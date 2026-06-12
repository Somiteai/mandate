# START — Mandate + OpenSpec workflow

Read this before writing application code in a new Mandate-based project.

## Phases

| Phase | Branch | Output |
|-------|--------|--------|
| **CAPTURE** | `capture/<name>` | `openspec/storms/<project>-capture.md` |
| **SHIP** | `ship/<change-name>` | Code + PR to `main` driven by OpenSpec tasks |

**Rule:** No feature code on `main` without an OpenSpec change whose `tasks.md` drove the work.

## New project checklist

1. Clone Mandate template → rename repo
2. Run `./scripts/init-project.sh` (project name + first change name)
3. Fill `openspec/storms/<project>-capture.md` (use template)
4. Human reviews capture — then **`/opsx:propose <change-name>`** until all artifacts exist
5. Human approves `proposal.md` — then **`/opsx:apply`** on `ship/<change-name>`
6. Merge PR to `main`
7. When all tasks are `[x]`, run **`/opsx:archive`** (syncs specs to `openspec/specs/`)

## Every agent session

1. Read `SOUL.md` and `AGENTS.md`
2. Read `openspec/ACTIVE_CHANGE` → open `openspec/changes/<name>/tasks.md`
3. Work the **first unchecked** task only
4. Branch `ship/<change-name>` or `ship/<change-name>-<slice>` — never push directly to `main`

## Commands (Cursor / Claude / OpenCode)

| Command | When |
|---------|------|
| `/opsx:propose <name>` | New feature — create proposal, design, specs, tasks **before** code |
| `/opsx:apply` | Implement tasks from active change |
| `/opsx:archive` | Change complete — archive and sync main specs |
| `/opsx:explore` | Thinking only — no application code |

## If you already built code without OpenSpec

1. Do **not** delete working code
2. Create change: `openspec new change <name>`
3. Write `proposal.md`, `design.md`, specs, `tasks.md` — mark completed work `[x]`, leave rest `[ ]`
4. Continue with `/opsx:apply` on remaining tasks

See `docs/mandate-openspec-improvements.md` for the full rationale.
