#!/bin/bash
# Usage: send_patch.sh <commit-or-branch>
# Reads patch from stdin and sends to CODEX_PATCH_SERVER.
set -ex;
commit=$1
patch_file=$(mktemp)
cat > "$patch_file"

curl -X POST "http://${CODEX_PATCH_SERVER}/apply-patch" \
  -H "X-Secret-Key: ${CODEX_PATCH_SERVER_SECRET}" \
  -F "commit=${commit}" \
  -F "patchFile=@${patch_file}"

rm "$patch_file"
