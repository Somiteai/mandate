## Context

Mandate is a **clone template**. OpenSpec in **this** repo describes the harness. OpenSpec in a **cloned product repo** describes that product. Mixing them was the original failure mode.

## Decisions

1. **Host vs container:** Homebrew, git, `gh`, Cursor, Docker Desktop on the Mac. Node, npm, OpenSpec CLI inside the Dev Container. No `npm i -g` on the host.
2. **Image:** Docker Official `node:22-bookworm`, not Microsoft MCR. Pin a digest after Docker Desktop is installed (`docker image inspect`).
3. **Mount:** default workspace only. Never mount `$HOME`.
4. **Global MDS:** `~/MDS/` is not a git submodule of Mandate. Landscape notes that apply to every project stay there.
5. **Product artifacts:** PRD, stakeholder specs, `src/` exist only after `init-project.sh` in the **product** clone.

## Risks

- Docker Desktop is privileged software; isolation is for npm, not for Cursor.
- macOS `/bin/bash` is 3.2; scripts must not use `${var,,}`.
