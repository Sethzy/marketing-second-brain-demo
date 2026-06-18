# Maintenance

Run local checks before publishing or changing the wiki:

```bash
scripts/lint-second-brain.sh
```

The lint script checks:

- required directories and files;
- JSON syntax for `state/source-map.json`;
- Markdown links to local files;
- source-map paths;
- obvious private or career-only strings.

When wiki knowledge changes:

1. Update the affected `wiki/marketing/*.md` page.
2. Update `wiki/index.md`.
3. Append `wiki/log.md`.
4. Update `state/source-map.json`.
5. Run `scripts/lint-second-brain.sh`.
6. Run `scripts/qmd-refresh.sh --embed` locally if QMD is installed.

