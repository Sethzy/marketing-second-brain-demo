#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: scripts/last30days-to-sweeps.sh <topic>" >&2
  exit 1
fi

topic="$*"

if ! command -v last30days >/dev/null 2>&1; then
  cat >&2 <<MSG
Last30Days is not installed in this public demo environment.

Expected private/live flow:
  last30days "$topic" > raw/sweeps/last30days/<slug>-raw.md

This repo includes completed sweep examples under raw/sweeps/last30days/.
See examples/last30days-to-wiki/README.md.
MSG
  exit 2
fi

slug="$(printf '%s' "$topic" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-//; s/-$//' | cut -c1-90)"
out="raw/sweeps/last30days/$slug-raw.md"
mkdir -p raw/sweeps/last30days
last30days "$topic" > "$out"
echo "$out"

