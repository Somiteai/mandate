# Harness vs product vs global MDS

## Mandate template (this git repo)

Source of truth for **how** we develop: Axel, branches, OpenSpec **commands**, hooks, conditional CI, Dev Container.

Allowed OpenSpec here: specs **about Mandate** (e.g. `macos-dev-environment`).  
Forbidden: product PRDs, app `src/`, a specific company’s playbooks.

## Product clone

`git clone` Mandate, `init-project.sh`, then this tree is **that product**:

- `openspec/config.yaml` — product name and stack  
- `openspec/storms/` — capture / PRD-level intent  
- `openspec/changes/` — OpenSpec SHIP  
- `docs/` — stakeholder-readable PRD, architecture  
- `src/` / tests — only when the product adds them  

Share **these** files with stakeholders, not a Cursor chat.

## `~/MDS/` (Mac disk, not this remote)

Cross-project landscape, templates you do not want copied into every clone. Agents must not commit `~/MDS/` into a product repo.
