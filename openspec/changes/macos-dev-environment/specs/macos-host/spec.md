# macos-host

Mandate’s recommended development host is **macOS** with Docker Desktop and a Dev Container. WSL is legacy, not recommended.

## Requirements

- The Mac host MAY install Homebrew core tools: git, gh, Docker Desktop.
- Node, npm, and the OpenSpec CLI MUST run in the Dev Container, not as unmanaged globals on the Mac.
- The Dev Container MUST use an official Node image and MUST NOT mount the user’s home directory.
- Git hooks MUST use LF line endings (`.gitattributes`).
- `scripts/init-project.sh` MUST run on macOS `/bin/bash` 3.2.
