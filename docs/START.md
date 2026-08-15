# START — Mandate loop (CAPTURE → SHIP)

Read this before writing **application** code. Mandate is the **harness**, not the product.

## Two libraries (do not mix)

| Library | Where | What |
|---|---|---|
| **Harness** | This repo (`Somiteai/mandate`) | `SOUL.md`, `AGENTS.md`, OpenSpec **of the template**, hooks, CI, Dev Container |
| **Product** | A **clone** after `./scripts/init-project.sh` | PRD, architecture, `openspec/storms/*-capture.md`, `openspec/changes/`, later `src/` |
| **Global MDS** | `~/MDS/` (**not git in this repo**) | Landscape/brainstorm that is not about one project |

Never put a product PRD or FlagFootballGirls specs in the Mandate template. That was the first design bug.

Details: [harness-vs-project.md](harness-vs-project.md).

## Phases (Harness + loop + OpenSpec)

| Phase | Branch | Output |
|---|---|---|
| **Explore / landscape** | none, or `capture/<name>` | Thinking only. Cross-project notes → `~/MDS/landscape/` |
| **CAPTURE (storm)** | `capture/<name>` | `openspec/storms/<project>-capture.md` |
| **Spec + plan** | `ship/<change-name>` | `proposal.md`, `design.md`, `specs/`, `tasks.md` |
| **Execute** | `ship/<change-name>` | First unchecked task only |
| **Archive** | PR to `main`, then archive | Living specs in `openspec/specs/` (product repo) |

**Rule:** No feature code on `main` without an OpenSpec change whose `tasks.md` drove the work.

OpenSpec is built for **changes to an existing repo**. Storms are how Mandate starts **before** that repo has a product.

## New project checklist

1. Clone **this** template → new GitHub repo (the product)
2. Open the clone in the Dev Container ([dev-environment.md](dev-environment.md))
3. Run `./scripts/init-project.sh` (project name + first change name) — this **replaces** Mandate’s `openspec/config.yaml` with the product
4. Delete or archive `openspec/changes/example-starter` if you do not need it
5. Fill `openspec/storms/<project>-capture.md` (PRD-level “what/why” lives here and in `docs/` of the **product**)
6. Human reviews capture — then write OpenSpec propose artifacts for `<change-name>`
7. Human approves `proposal.md` — then apply `tasks.md`
8. Merge PR to `main`; when tasks are `[x]`, archive the change

## Every agent session

1. Read `SOUL.md` and `AGENTS.md`
2. Confirm you are in a **product** clone before writing product specs
3. Read `openspec/ACTIVE_CHANGE` → `openspec/changes/<name>/tasks.md`
4. First unchecked task only
5. Branch `ship/<change-name>` — never push `main`

## Workflow steps (any tool)

These are **file and git** operations. Slash-command aliases are optional.

| Step | When |
|---|---|
| Explore | Landscape — no app code (`docs/ide-agnostic.md`) |
| Propose | Write `proposal.md`, `design.md`, `specs/`, `tasks.md` before code |
| Apply | Implement the first unchecked task |
| Archive | Change done — sync `openspec/specs/` |
