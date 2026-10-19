#!/usr/bin/env bash
# post-clone.sh - Reconfigures LSP after cloning this repository.
# Run once from the project root.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for candidate in     "${SCRIPT_DIR}/setup_lsp.sh"     "${SCRIPT_DIR}/templates/setup_lsp.sh"; do
    if [[ -x "$candidate" ]]; then
        exec "$candidate" "$@"
    fi
done

echo 'ERROR: setup_lsp.sh not found.' >&2
exit 1
