#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 3 ]]; then
  echo "Usage: scripts/new-raw-capture.sh <source-type> <title> <url> < source.txt" >&2
  exit 1
fi

source_type="$1"
title="$2"
url="$3"
date="$(date +%F)"
slug="$(printf '%s' "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-//; s/-$//' | cut -c1-70)"
dir="raw/intentional/$source_type"
file="$dir/$date-$slug.md"

mkdir -p "$dir"

if [[ -e "$file" ]]; then
  i=2
  while [[ -e "$dir/$date-$slug-$i.md" ]]; do
    i=$((i + 1))
  done
  file="$dir/$date-$slug-$i.md"
fi

body="$(cat)"

{
  printf -- "---\n"
  printf "type: raw_capture\n"
  printf "source_type: %s\n" "$source_type"
  printf "title: \"%s\"\n" "$title"
  printf "url: \"%s\"\n" "$url"
  printf "collected_at: %s\n" "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  printf "published_at: Unknown\n"
  printf "capture_quality: complete\n"
  printf "status: raw\n"
  printf "trust_lane: intentional\n"
  printf -- "---\n\n"
  printf "# %s\n\n" "$title"
  printf "Source: %s\n\n" "$url"
  printf "## Capture Text\n\n"
  printf "%s\n" "$body"
} > "$file"

echo "$file"

