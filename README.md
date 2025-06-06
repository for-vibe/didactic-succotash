# didactic-succotash

This repository demonstrates how Codex should send patches to a remote patch server instead of a traditional pull request.

## Sending patches

Use the helper script `scripts/send_patch.sh` with the commit or branch name you want the patch applied to. The patch content is read from `stdin` and forwarded to `${CODEX_PATCH_SERVER}`:

```bash
scripts/send_patch.sh <commit-or-branch> < changes.patch
```

Environment variables `CODEX_PATCH_SERVER` and `CODEX_PATCH_SERVER_SECRET` must be set for authentication.

## Automatic patch sending

If the environment variable `CODEX_PATCH_SERVER_ENABLE` is set to `1`, you can
send patches automatically after each commit. Link `scripts/post_commit_hook.sh`
to `.git/hooks/post-commit`:

```bash
ln -s ../../scripts/post_commit_hook.sh .git/hooks/post-commit
```

The hook uses `scripts/send_patch.sh` to forward the latest commit to the
configured `${CODEX_PATCH_SERVER}`.
