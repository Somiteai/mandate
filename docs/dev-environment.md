# Development environment (Mandate on macOS)

WSL/Windows is **legacy**. Do not follow old WSL paste/`npx` `.cursor-server` notes on this Mac.

## Once per Mac (host)

1. FileVault on (System Settings → Privacy & Security).
2. Homebrew (core only). Do not `brew tap` strangers.
3. `brew install git gh mise` and Docker Desktop (`brew install --cask docker-desktop` — needs your Mac password).
4. `gh auth login` — GitHub.com, HTTPS, browser.
5. Cursor. Open the **project folder**, then **Reopen in Container**.
6. Create `~/MDS/` for global landscape (see [harness-vs-project.md](harness-vs-project.md)).

**On the host:** git, gh, Docker, Cursor, Homebrew.  
**Not on the host:** Node, npm, `openspec` CLI (those belong in the container).

`mise` may live on the host for non-container tools; Node for Mandate work still runs **in** the Dev Container.

## Once per clone (container)

`.devcontainer/devcontainer.json` uses Docker Official **Node 22 (bookworm)**. The workspace is this repo only — not `$HOME`.

After Docker Desktop is running, pin the image digest:

```bash
docker pull node:22-bookworm
docker image inspect node:22-bookworm --format '{{index .RepoDigests 0}}'
```

Put that digest in `devcontainer.json` `image` (`node@sha256:...`) so `:22-bookworm` cannot silently move.

Inside the container:

```bash
node -v          # 22.x
./scripts/setup-git-hooks.sh
# OpenSpec CLI (container only):
npm install --prefix /usr/local @fission-ai/openspec
# or npx @fission-ai/openspec …  — do not npm -g on the Mac host
```

## Git hooks

```bash
./scripts/setup-git-hooks.sh
```

Sets `core.hooksPath` **in this repo only**. Hooks must be **LF** (`.gitattributes`). CRLF breaks bash.

## OpenSpec

```bash
cat openspec/ACTIVE_CHANGE
```

Product work: fill `openspec/storms/`, then `/opsx:propose`. Do not store product specs in the Mandate template remote.

## SQLite (only if the product uses it)

In the **product** clone, inside the container: stop `npm run dev` before `db:push` if you see `database is locked`.
