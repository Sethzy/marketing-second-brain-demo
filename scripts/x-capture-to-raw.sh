#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: scripts/x-capture-to-raw.sh <x-status-url>" >&2
  exit 1
fi

url="$1"

if [[ ! "$url" =~ ^https://(x|twitter)\.com/.+/status/[0-9]+ ]]; then
  echo "Expected an X/Twitter status URL." >&2
  exit 1
fi

cat >&2 <<'MSG'
This public demo does not include browser cookies or authenticated X capture tooling.

In a private Second Brain, this command wraps an authenticated TweetDetail
capture and writes complete posts to raw/intentional/x/ while staging partial
captures under staging/incomplete-captures/x/.

See examples/x-capture-to-wiki/README.md for the completed demo flow.
MSG

exit 2

