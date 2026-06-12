# Development environment (Mandate projects)

## Cursor + WSL (recommended)

1. Install WSL2 + Ubuntu
2. Install Cursor WSL extension
3. Open project from WSL terminal:

   ```bash
   cd ~/projects/<your-repo>
   cursor .
   ```

4. Confirm status bar shows **WSL: Ubuntu** (not only a Windows path)

## Git hooks

Mandate uses `.githooks/pre-push` to block pushes **to** `main`.

```bash
./scripts/setup-git-hooks.sh
```

This sets `git config core.hooksPath .githooks` in **this repo only**.

Hooks must use **LF** line endings (see `.gitattributes`). CRLF breaks bash with `syntax error: unexpected end of file`.

## Terminal paste (WSL)

In Cursor’s integrated terminal, **right-click** often pastes when `Ctrl+Shift+V` does not.

## Node / npm

Run install and dev commands inside WSL:

```bash
node -v   # prefer 20.19+ or 22.x for latest eslint
npm install
```

If `npx` fails with `.cursor-server` path errors, use system npm:

```bash
export NPM_CONFIG_PREFIX=/tmp/npm-global
export NPM_CONFIG_CACHE=/tmp/npm-cache
mkdir -p "$NPM_CONFIG_PREFIX/lib" "$NPM_CONFIG_CACHE"
```

## OpenSpec CLI

```bash
npm install -g @fission-ai/openspec@latest
openspec --version
```

Check active change:

```bash
cat openspec/ACTIVE_CHANGE
openspec status --change "$(cat openspec/ACTIVE_CHANGE)"
```

## Database (when project uses SQLite)

```bash
npm run db:push   # not "dp:push"
npm run db:seed
```

If `database is locked`, stop `npm run dev`, run db commands, restart dev.
