# Instructions for Codex

Codex should deliver patches to a remote patch server instead of opening a pull request. Use the script `scripts/send_patch.sh` from the repository root.

When you need to submit a patch, run:

```bash
scripts/send_patch.sh <commit-or-branch> < changes.patch
```

Replace `<commit-or-branch>` with the commit hash or branch name that should be checked out before applying the patch. The patch file is expected on stdin.
