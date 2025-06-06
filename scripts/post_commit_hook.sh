#!/bin/bash
# Post-commit hook that automatically sends the latest commit as a patch
# to the Codex patch server when CODEX_PATCH_SERVER_ENABLE=1.

set -euo pipefail

if [ "${CODEX_PATCH_SERVER_ENABLE:-0}" = "1" ]; then
    commit=$(git rev-parse HEAD)
    git format-patch -1 --stdout "$commit" |
        "$(dirname "$0")/send_patch.sh" "$commit"
fi
