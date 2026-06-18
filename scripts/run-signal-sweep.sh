#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: scripts/run-signal-sweep.sh <topic>" >&2
  exit 1
fi

topic="$*"
runner="${SIGNAL_SWEEP_CMD:-}"

if [[ -z "$runner" ]]; then
  cat >&2 <<MSG
The private Signal Sweep runner is not bundled in this public demo.

Expected private/live flow:
  SIGNAL_SWEEP_CMD=/path/to/signal-sweep scripts/run-signal-sweep.sh "$topic"

The runner should fan out to configured sources, score engagement-backed
evidence clusters, and print Markdown to stdout.

This repo includes completed scan examples under raw/sweeps/signal-sweeps/.
See examples/signal-sweep-to-wiki/README.md.
MSG
  exit 2
fi

if ! command -v "$runner" >/dev/null 2>&1 && [[ ! -x "$runner" ]]; then
  echo "Signal Sweep runner not found: $runner" >&2
  exit 2
fi

slug="$(printf '%s' "$topic" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-//; s/-$//' | cut -c1-90)"
out="raw/sweeps/signal-sweeps/$slug-raw.md"
mkdir -p raw/sweeps/signal-sweeps
"$runner" "$topic" > "$out"
echo "$out"
