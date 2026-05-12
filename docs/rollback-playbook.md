# Rollback Playbook

## Revert a single commit (already pushed)
```bash
git revert <commit-sha>
git push origin <branch>
```

## Revert a merged PR
1. Identify the merge commit SHA: `git log --oneline`
2. `git revert -m 1 <merge-commit-sha>`
3. Push and open a PR to land the revert on main

## Nuclear: reset branch to a known good state
Only with explicit human approval:
```bash
git reset --hard <known-good-sha>
git push --force origin <branch>
```
Never run this on main.
