# Decision Log

Non-obvious decisions made during the Mandate build.
Add an entry any time a significant choice is made that isn't
obvious from the code or spec.

---

## 2026-05-11 — Two-phase workflow (CAPTURE → SHIP)
**Decision:** No separate compress phase.
**Why:** Compression added coordination overhead without clear value
for the project sizes Mandate targets.

## 2026-05-11 — Conditional CI
**Decision:** Workflows gate on file existence rather than failing on
missing configs.
**Why:** Mandate is a template. A missing test suite is not a failure —
it means the cloner hasn't added their stack yet.

## 2026-05-11 — .githooks/ over .git/hooks/
**Decision:** Store hooks in `.githooks/` (committed) not `.git/hooks/`
(untracked).
**Why:** Hooks need to be part of the template so cloners get them.
Requires `git config core.hooksPath .githooks` after cloning.

## 2026-05-11 — Agent named Axel (not Harbor)
**Decision:** Renamed agent persona from Harbor to Axel.
**Why:** Harbor (from harness-starter) felt cautious and passive.
Axel reflects a builder-oriented identity — productive, direct,
not reckless.

## 2026-08-15 — macOS + Dev Container; harness vs product specs

**Decision:** Recommend macOS + official Node 22 Dev Container (non-root). Keep product PRD/OpenSpec out of the Mandate template; use `~/MDS/` for cross-project landscape.
**Why:** WSL docs were host-specific. Putting project specs in the template caused CI/spec collisions. OpenSpec stays the SHIP format; storms stay CAPTURE. Canonical contract is `SOUL.md` / `AGENTS.md` / `openspec/` / `docs/` — not per-vendor IDE folders.
