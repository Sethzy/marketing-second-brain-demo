#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if ! command -v qmd >/dev/null 2>&1; then
  echo "qmd is not installed. Install with: npm install -g @tobilu/qmd" >&2
  exit 1
fi

qmd update

if [[ "${1:-}" == "--embed" ]]; then
  qmd embed
fi

echo "QMD refresh complete. Do not commit .qmd/."

