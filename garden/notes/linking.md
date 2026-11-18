---
title: "Linking notes"
date: "2026-01-01"
description: "Wikilinks, Markdown links and the graph"
topic: "Guide"
tags:
  - guide
  - links
---

# Linking notes

Links are what turn a folder of notes into a garden.

- A wikilink uses the file name: `[[writing-posts]]` becomes
  [[writing-posts]].
- Change the text after a `|`: `[[writing-posts|this guide]]` becomes
  [[writing-posts|this guide]].
- Point at a heading with `#`: [[writing-posts#Drafts|drafts]].
- Regular Markdown links work too, written from the garden root:
  [the home page](welcome).
- `![[writing-posts#Tags]]` embeds that section right here:

![[writing-posts#Tags]]

Every link shows up as a backlink on the page it points to, and in the graph.

A link to a note that doesn't exist yet is shown as unresolved, and
`garden-engine check` lists it as a warning so you can write it later.
