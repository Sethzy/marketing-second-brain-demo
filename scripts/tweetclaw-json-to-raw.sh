#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: scripts/tweetclaw-json-to-raw.sh <title> <tweetclaw-json> [source-url]" >&2
  exit 1
fi

title="$1"
json_path="$2"
source_url="${3:-Unknown}"

python3 - "$title" "$json_path" "$source_url" <<'PY'
from __future__ import annotations

from datetime import datetime, timezone
import json
import re
import sys
from pathlib import Path
from typing import Any


title, json_path, source_url = sys.argv[1:4]
root = Path.cwd()
input_path = Path(json_path)

if not input_path.exists():
    raise SystemExit(f"missing input JSON: {json_path}")

data = json.loads(input_path.read_text(encoding="utf-8"))


def candidates(value: Any) -> list[dict[str, Any]]:
    if isinstance(value, list):
        return [item for item in value if isinstance(item, dict)]
    if not isinstance(value, dict):
        return []
    for key in ("tweets", "posts", "items", "results", "data"):
        child = value.get(key)
        if isinstance(child, list):
            return [item for item in child if isinstance(item, dict)]
    for key in ("tweet", "post", "result"):
        child = value.get(key)
        if isinstance(child, dict):
            return [child]
    return [value]


def first_text(item: dict[str, Any], keys: tuple[str, ...]) -> str:
    for key in keys:
        value = item.get(key)
        if isinstance(value, str) and value.strip():
            return value.strip()
    return ""


def author_text(item: dict[str, Any]) -> str:
    author = item.get("author") or item.get("user")
    if isinstance(author, dict):
        value = first_text(
            author,
            ("username", "screenName", "screen_name", "handle", "name"),
        )
        if value:
            return value
    return first_text(item, ("username", "screenName", "screen_name", "handle", "author"))


def tweet_url(item: dict[str, Any]) -> str:
    value = first_text(item, ("url", "tweetUrl", "tweet_url", "permalink", "link"))
    if value:
        return value
    tweet_id = first_text(item, ("id", "tweetId", "tweet_id"))
    author = author_text(item).lstrip("@")
    if tweet_id and author:
        return f"https://x.com/{author}/status/{tweet_id}"
    if tweet_id:
        return f"https://x.com/i/web/status/{tweet_id}"
    return "Unknown"


def count_text(item: dict[str, Any], keys: tuple[str, ...]) -> str:
    for key in keys:
        value = item.get(key)
        if isinstance(value, (int, float)):
            return str(value)
    return "Unknown"


records = [
    item
    for item in candidates(data)
    if first_text(item, ("text", "fullText", "full_text", "content", "body"))
]

if not records:
    raise SystemExit("no tweet-like records with text found")

slug = re.sub(r"[^a-z0-9]+", "-", title.lower()).strip("-")[:70] or "tweetclaw-capture"
date = datetime.now(timezone.utc).date().isoformat()
out_dir = root / "raw" / "intentional" / "x"
out_dir.mkdir(parents=True, exist_ok=True)
out_path = out_dir / f"{date}-{slug}.md"

suffix = 2
while out_path.exists():
    out_path = out_dir / f"{date}-{slug}-{suffix}.md"
    suffix += 1

if source_url == "Unknown":
    source_url = tweet_url(records[0])

lines = [
    "---",
    "type: raw_capture",
    "source_type: x",
    f'title: "{title}"',
    f'url: "{source_url}"',
    f"collected_at: {datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace('+00:00', 'Z')}",
    "published_at: Unknown",
    "capture_quality: complete",
    "status: raw",
    "trust_lane: intentional",
    "---",
    "",
    f"# {title}",
    "",
    f"Source: {source_url}",
    "",
    "## Capture Text",
    "",
]

for index, item in enumerate(records, start=1):
    text = first_text(item, ("text", "fullText", "full_text", "content", "body"))
    url = tweet_url(item)
    author = author_text(item) or "Unknown"
    created = first_text(item, ("created", "createdAt", "created_at", "published_at")) or "Unknown"
    lines.extend(
        [
            f"### Tweet {index}",
            "",
            f"- URL: {url}",
            f"- Author: {author}",
            f"- Created: {created}",
            f"- Likes: {count_text(item, ('likeCount', 'like_count', 'likes'))}",
            f"- Reposts: {count_text(item, ('retweetCount', 'retweet_count', 'reposts'))}",
            f"- Replies: {count_text(item, ('replyCount', 'reply_count', 'replies'))}",
            f"- Views: {count_text(item, ('viewCount', 'view_count', 'views'))}",
            "",
            text,
            "",
        ]
    )

out_path.write_text("\n".join(lines).rstrip() + "\n", encoding="utf-8")
print(out_path.as_posix())
PY
