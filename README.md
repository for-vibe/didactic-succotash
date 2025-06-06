# didactic-succotash

This repository demonstrates how Codex should send patches to a remote patch server instead of a traditional pull request.

## Sending patches

Use the helper script `scripts/send_patch.sh` with the commit or branch name you want the patch applied to. The patch content is read from `stdin` and forwarded to `${CODEX_PATCH_SERVER}`:

```bash
scripts/send_patch.sh <commit-or-branch> < changes.patch
```

Environment variables `CODEX_PATCH_SERVER` and `CODEX_PATCH_SERVER_SECRET` must be set for authentication.
