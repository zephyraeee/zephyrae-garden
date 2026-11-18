---
title: "How to write a post"
date: "2026-01-01"
description: "Front matter, tags, drafts and translations"
topic: "Guide"
tags:
  - guide
  - writing
---

# How to write a post

Every post is a Markdown file inside `garden/`. Folders are up to you: they show
up in the explorer and in each post's address, so this note lives at
`/posts/notes/writing-posts`.

## Front matter

Each file starts with a block like this one:

```yaml
---
title: "How to write a post"
date: "2026-01-01"
description: "Front matter, tags, drafts and translations"
topic: "Guide"
tags:
  - guide
  - writing
---
```

`title`, `date`, `description` and `tags` are required; `topic` is optional.
A post without valid front matter is left out of the site, and `garden-engine check`
tells you which one and why.

## Tags

Tags come from the `tags` list and from `#hashtags` written in the text, like
#writing. Each tag gets its own page under `/tags`.

## Drafts

Add `is_draft: true` to the front matter to keep a post out of lists, search and
the graph while you work on it.

## Translations

Save a translation next to the original with the language before `.md`:
`welcome.es.md` is the Spanish version of `welcome.md`. Visitors see the version
that matches their language.

## When a post was updated

The "last updated" date comes from the git history of each file, so it stays
right without editing anything by hand.

Next: [[linking|Linking notes]].
