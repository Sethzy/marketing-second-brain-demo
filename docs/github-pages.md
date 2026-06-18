# GitHub Pages

This repo is designed to publish the `docs/` directory as a static GitHub Pages site.

The front door is:

```text
docs/index.html
```

It links back into the repo's README, wiki, docs, examples, and source files. There is no build step.

Suggested GitHub Pages settings:

```text
Source: Deploy from a branch
Branch: main
Folder: /docs
```

The included `.github/workflows/pages.yml` also supports Actions-based deployment for repositories that prefer workflow publishing.

