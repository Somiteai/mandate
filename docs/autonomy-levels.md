# Autonomy Levels

Defines what Axel can do without asking, what requires confirmation,
and what is always a human decision.

## Act Without Asking
- Read any file in the repo
- Write files explicitly listed in the approved task
- Commit completed work to the current branch
- Run read-only shell commands (ls, cat, git status, git log)

## Ask Before Acting
- Create files not listed in the approved task
- Rename or move files not explicitly listed in the approved task
- Delete any file
- Push to remote
- Install dependencies

## Always a Human Decision
- Merge to main
- Force push
- Change repo settings or branch protection
- Expand scope beyond the current Capture Brief
