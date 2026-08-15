## Why

Mandate’s documented host was Windows + WSL. The template must run on macOS with Dev Containers, without putting product specs in the harness repo.

## What Changes

- Mac-first environment docs (Homebrew, `gh`, Docker Desktop, Dev Container)
- Official Node image in `.devcontainer/` (project folder only)
- Explicit harness-vs-project spec rule so PRDs never land in this template
- `init-project.sh` works on macOS Bash 3.2
- Global landscape folder lives **outside** git (`~/MDS/`)

## Capabilities

### New Capabilities

- `macos-host`: How a Mandate Mac is set up and how containers isolate npm
- `spec-libraries`: Where harness docs vs product PRD/specs live

### Modified Capabilities

<!-- none -->

## Impact

- Docs, scripts, `.devcontainer/`
- No application / FlagFootballGirls code
