# IDE- and agent-agnostic

Mandate is a **git-hosted development system**. It is not a Cursor product, not a Claude skill pack, not a Grok/Copilot/Codex plugin.

## Source of truth (any IDE)

An agent or human must be able to follow Mandate with only:

- `SOUL.md`
- `AGENTS.md`
- `openspec/` (storms, changes, specs, `ACTIVE_CHANGE`)
- `docs/`
- `scripts/`
- `.githooks/`
- `.devcontainer/` (optional isolation; any tool that implements the Dev Container spec)

## Not source of truth

Trees such as `.cursor/`, `.claude/`, `.gemini/`, `.opencode/`, and vendor prompt folders may exist from earlier experiments. **Do not revise them as the harness.** Do not add new per-vendor “how to behave” files. If a tool ignores `AGENTS.md`, that is a tool limitation, not a reason to fork Mandate.

## Loop (names, not products)

Explore → Capture (storm) → Propose (OpenSpec artifacts) → Apply (tasks) → Archive.  
Slash commands like `/opsx:propose` are optional bindings some UIs add. The files and git branches are the contract.
