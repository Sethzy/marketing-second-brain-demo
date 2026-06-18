#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

required_paths=(
  "README.md"
  "AGENTS.md"
  "docs/index.html"
  "wiki/index.md"
  "wiki/log.md"
  "state/source-map.json"
  "raw"
  "staging"
  "wiki/marketing"
)

for path in "${required_paths[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "missing required path: $path" >&2
    exit 1
  fi
done

python3 -m json.tool state/source-map.json >/dev/null

python3 - <<'PY'
from pathlib import Path
import json
import re
import sys

root = Path(".").resolve()
errors = []

link_pattern = re.compile(r'(?<!!)\[[^\]]+\]\(([^)]+)\)')
link_roots = [
    root / "README.md",
    root / "AGENTS.md",
    root / "docs",
    root / "examples",
    root / "wiki",
]
link_files = []
for item in link_roots:
    if item.is_file():
        link_files.append(item)
    elif item.is_dir():
        link_files.extend(item.rglob("*.md"))
        link_files.extend(item.rglob("*.html"))

for md in link_files:
    if ".git" in md.parts:
        continue
    text = md.read_text(encoding="utf-8", errors="ignore")
    for raw_target in link_pattern.findall(text):
        target = raw_target.split("#", 1)[0].strip()
        if not target or target.startswith(("http://", "https://", "mailto:")):
            continue
        if target.startswith("<") and target.endswith(">"):
            target = target[1:-1]
        resolved = (md.parent / target).resolve()
        try:
            resolved.relative_to(root)
        except ValueError:
            errors.append(f"{md.relative_to(root)} links outside repo: {raw_target}")
            continue
        if not resolved.exists():
            errors.append(f"{md.relative_to(root)} missing link target: {raw_target}")

source_map = json.loads((root / "state/source-map.json").read_text())
for entry in source_map.get("sources", []):
    for key in ("raw_path", "staging_path"):
        value = entry.get(key)
        if value and not (root / value).exists():
            errors.append(f"source-map missing {key}: {value}")
    for value in entry.get("wiki_paths", []):
        if value and not (root / value).exists():
            errors.append(f"source-map missing wiki path: {value}")
    for value in entry.get("staging_paths", []):
        if value and not (root / value).exists():
            errors.append(f"source-map missing staging path: {value}")

private_terms = [
    "seth" + "limzy",
    "97" + "99",
    "candidate-" + "controlled",
    "work " + "authorization",
    "Green" + "house",
    "application " + "form",
    "final " + "submit",
    "WhatsApp " + "recruiting",
    "voluntary " + "gender",
]
private_pattern = re.compile("|".join(re.escape(term) for term in private_terms), re.IGNORECASE)
for path in root.rglob("*"):
    if path.is_dir() or ".git" in path.parts:
        continue
    if path.suffix.lower() not in {".md", ".html", ".json", ".sh", ".yml", ".yaml", ".txt"}:
        continue
    text = path.read_text(encoding="utf-8", errors="ignore")
    if private_pattern.search(text):
        errors.append(f"possible private/career-only term in {path.relative_to(root)}")

if errors:
    print("lint failed:")
    for error in errors:
        print(f"- {error}")
    sys.exit(1)

print("lint passed")
PY
