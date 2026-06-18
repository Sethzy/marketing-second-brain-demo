#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: scripts/stage-last30days-digest.sh raw/sweeps/last30days/<file>.md" >&2
  exit 1
fi

raw_file="$1"
if [[ ! -f "$raw_file" ]]; then
  echo "Raw sweep file not found: $raw_file" >&2
  exit 1
fi

base="$(basename "$raw_file" .md)"
date="$(date +%F)"
out="staging/last30days/$date-${base%-raw}-digest.md"
mkdir -p staging/last30days

{
  printf "# Last30Days Digest: %s\n\n" "$base"
  printf "Source raw: [%s](../../%s)\n\n" "$raw_file" "$raw_file"
  printf "## Trust Lane\n\n"
  printf "This is a staged digest. Treat it as recent signal until exact sources are captured or a reviewer promotes the pattern into wiki.\n\n"
  printf "## High-Signal Themes\n\n"
  printf "- Review the raw sweep and list recurring marketing workflow patterns.\n"
  printf "- Promote only claims that are source-backed or clearly marked as trends.\n\n"
  printf "## Candidate Wiki Updates\n\n"
  printf "- wiki/marketing/agentic-marketing-workflows.md\n"
  printf "- wiki/marketing/marketing-analytics-and-fda-enablement.md\n\n"
  printf "## Open Questions\n\n"
  printf "- Which exact sources should be captured before promotion?\n"
} > "$out"

echo "$out"

