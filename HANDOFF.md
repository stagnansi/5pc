# Handoff

This document describes the 5PC® project for anyone (human or AI) continuing work on it. Read this before making changes.

## Project

5PC® (Five Pillars Compendium®) is a pop culture criticism site. Angle: one title, five ways to dissect it. Five pillars: Film, Series, Books, Games, Music. Language: English.

- Live: https://5pc.pages.dev
- Repo: https://github.com/stagnansi/5pc
- Local: ~/5pc

Stack: Hugo (static site generator) + Bear Blog theme (janraasch/hugo-bearblog). Deployed via Cloudflare Pages on every push to main. Built from Termux on Android.

## Infrastructure

- Cloudflare Pages: auto-deploy from main branch
- GitHub: origin is stagnansi/5pc
- Hugo version: 0.166.0+extended
- Theme: hugo-bearblog (vendored in themes/)

## Directory Structure

content/                  Markdown content
  _index.md              Homepage body
  about/                 About page
  blog/                  Essays
    _index.md
    <slug>.md
  film/                  Pillar: film
  series/                Pillar: series
  books/                 Pillar: books
  games/                 Pillar: games
  music/                 Pillar: music
  pillars/               Index of all pillar posts
  franchise/             Franchise hubs
    _index.md
    <id>/                e.g. 007/
      _index.md          Hub content with franchise_id
layouts/                 Site-level overrides (not in theme)
  _default/
    list.html            Section lists
    single.html          Pillar post template
  index.html             Homepage template
  about/list.html        About layout
  pillars/list.html      Pillars index with nav row + aligned list
  franchise/list.html    Franchise index + hub with Related Blogs
  partials/
    custom_head.html     Fonts, colors, CSS (site-wide)
    footer.html          Custom footer
hugo.toml                Site config
CHANGELOG.md             Keep a Changelog + SemVer
HANDOFF.md               This file

## Work Rules

Command style:
- Single line, single purpose
- Prefix with `p &&` (alias for `cd ~/5pc`)
- For writing files: `printf '%b' ... > file` (not heredoc)
- For small edits: `sed -i`
- Long output: `command > $TMPDIR/out.txt 2>&1 ; termux-clipboard-set < $TMPDIR/out.txt ; cat $TMPDIR/out.txt`

Aliases in ~/.bashrc:
- `p` = `cd ~/5pc`
- `h` = `hugo server --noBuildLock`

Hugo server is foreground. Kill with Ctrl+C before running other commands.

Commit ritual:
- Always update CHANGELOG.md in the same commit as code/content changes
- Push to main after every milestone
- Tag releases per version rules below

## Content Conventions

Language: English only.

Brand:
- Always `5PC®` (never without ®)
- Always `Five Pillars Compendium®` (never without ®)
- ® is never inside a link, always plain text

Punctuation:
- No em dash. Use period, comma, or sentence break instead.

Blog essays:
- Short titles (3-5 words). Follow existing pattern: "Why Bond Skipped TV", "A Robot Child on the Moon".
- No headings inside body. Essay flows.
- Bold, opinionated first-person voice. Herman's bearblog style.

Pillar posts:
- Standard structure: intro paragraph, `## For Newcomers` (skip for music), `## The Story`.
- Front matter includes `release` (YYYY-MM-DD) and `franchise` (id, optional).
- Music format: title is `Artist - Song (Year)`, e.g. "Adele - Skyfall (2012)". No For Newcomers section.
- Slug follows title, e.g. `adele-skyfall-2012`.

Franchise hubs:
- Front matter includes `franchise_id` and `description`.
- Body sections: intro paragraph (no heading), `## For Newcomers`, `## Five Pillars`.
- Five Pillars uses `<details>` blocks with `<ul>` lists, sorted by release year.
- Related Blogs section is auto-generated (via layout) filtered by `franchise` front matter on blog posts.

## Design System

Colors (in layouts/partials/custom_head.html):
- --background-color: #fff
- --heading-color: #222
- --text-color: #444
- --link-color: #0000ff
- --visited-color: #0000ff
- --blockquote-color: #222
- color-scheme: light (dark mode disabled)

Fonts:
- --font-main: InterDisplay (headings)
- --font-secondary: Inter (body)
- --font-mono: IBM Plex Mono (dates, list content)

Rules in custom_head.html:
- .title h2: InterDisplay 900 (site title)
- time: mono
- .tagline a: heading color, solid underline in link color
- footer: brand left, back-to-top arrow right
- details summary: plus/minus toggle, hover changes color
- content ul (except .blog-posts and grid): arrow markers with hanging indent

## Layout Overrides

All in layouts/ (site-level, not in theme):
- _default/list.html: adds h1, uses .blog-posts for post list
- _default/single.html: pillar post template with h1, release date, franchise then pillar line
- index.html: homepage with Latest Pillars, Latest Blogs, Featured Franchise
- pillars/list.html: nav row + aligned list (grid with column-gap)
- franchise/list.html: index shows cards; hub shows Related Blogs
- about/list.html: h1 + content
- partials/custom_head.html: all site CSS and font links
- partials/footer.html: footer structure (baseof already wraps in footer tag)

## Version Rules

SemVer (MAJOR.MINOR.PATCH). Tag only at milestones, not every push.

- MAJOR: breaking change (URL pattern change, theme replacement, section removal)
- MINOR: new feature or batch (new franchise hub, homepage redesign, 3 or more pillar posts)
- PATCH: 1-2 posts, bug fixes, small tweaks

Cosmetic-only pushes do not trigger a version. They go into [Unreleased] in CHANGELOG.md until the next milestone.

Tag format: annotated tags, vX.Y.Z. Push with git push origin --tags. Create GitHub release with gh release create.

## Current State

As of v1.3.2 (2026-09-23):

Content:
- 2 pillar posts: 007 First Light (games), Adele - Skyfall (music)
- 2 blog essays: Why Bond Skipped TV, A Robot Child on the Moon
- 1 franchise hub: James Bond 007 (full catalog across 5 pillars)

Site structure stable. Cloudflare auto-deploy on push.

## Pending Work

- Many pillar posts are placeholders (listed in franchise hub 007 but no post yet)
- UI library decision: considered classless CSS frameworks (Pico, Water, Simple) but not adopted. Custom CSS is the current approach.
- No search feature (considered and dropped).
- Franchise hubs other than 007 not started.

## Gotchas

Termux environment:
- Paste of multi-line commands can break. Always use printf %b with single line and \n.
- Do not use sed with ampersand as replacement character.
- /tmp does not exist. Use $TMPDIR (usually /data/data/com.termux/files/usr/tmp).
- Hugo server is foreground: Ctrl+C before running other commands.
- termux-clipboard-set needs Termux:API app installed, otherwise it hangs.

Hugo:
- timeZone must be set (Asia/Jakarta) or future-dated posts will not render.
- [permalinks] section must not override defaults or URL pattern breaks.
- Raw HTML in markdown requires [markup.goldmark.renderer] unsafe = true.

Layout:
- baseof.html already wraps content in footer tag. Partial footer.html must not add another footer tag (nested).
