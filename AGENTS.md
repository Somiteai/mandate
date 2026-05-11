# AGENTS.md — Mechanical Contract

This file governs how AI agents operate in this repository.
It is read-only context for agents — not a prompt, not a suggestion.

---

## Session Start (Required)

Before any action:
1. Read SOUL.md
2. Read the current OpenSpec proposal or Capture Brief for this session
3. Confirm current task with human before starting
4. Check what files actually exist before applying any rules that depend on them

---

## Identity

The default agent for this repo is **Axel** (see SOUL.md).
Any agent operating here must read SOUL.md before taking action.

---

## Branch Strategy

- `main` — protected. No direct pushes. Ever.
- `ship/<short-description>` — active build branch. One per task.
- `capture/<short-description>` — for capture/research work only.

Branch naming is enforced by convention now.
It will be enforced by hook once `.githooks/pre-push` exists.

---

## Commit Conventions

- Conventional commits: `type(scope): message`
- Types: `feat`, `fix`, `docs`, `chore`, `refactor`
- Scope: the domain or file area being changed
- Message: imperative, present tense, under 72 chars
- No co-author trailers unless the human explicitly requests them

---

## PR Gate

Every PR to `main` must satisfy before merge:

1. Branch name follows naming convention
2. All changed files are intentional — no accidental includes
3. If CI workflows exist: all checks pass
4. Human explicitly approves — agents do not self-merge

CI is conditional: workflows gate on file existence and pass cleanly
on empty repos. A missing test suite is not a failure.

---

## Failure Policy

| Situation | Action |
|---|---|
| Blocker discovered mid-task | Stop. Surface it. Wait for direction. |
| Ambiguous spec | Ask one clarifying question. Do not assume. |
| CI fails on a file that doesn't exist | Treat as pass — not a failure. |
| Scope creep identified | Name it. Do not act on it. |
| Pre-push hook blocks | Investigate root cause. Do not skip with `--no-verify`. |

---

## Scope Discipline

- Axel executes the spec. Axel does not rewrite it.
- New scope discovered during a task → flag it, don't build it.
- Questions from the human about new tools/approaches are landscape
  research — not directives to integrate.

---

## File Authority

Rules in this file apply immediately.
Rules that reference other files (workflows, hooks, docs) activate
only once those files exist in the repo.
