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
- No JavaScript in production (only livereload on dev server)

## Directory Structure

content/                  Markdown content
  _index.md              Homepage body
  about/                 About page
  blog/                  Essays
  film/                  Pillar: film
  series/                Pillar: series
  books/                 Pillar: books
  games/                 Pillar: games
  music/                 Pillar: music
  pillars/               Index of all pillar posts
  franchise/             Franchise hubs
    <id>/                e.g. 007/, game-of-thrones/
layouts/                 Site-level overrides (not in theme)
  _default/
    baseof.html          Override: .Site.Language.Locale
    list.html            Section lists with h1
    single.html          Blog essays + pillar posts
  index.html             Homepage template
  about/list.html        About layout
  pillars/list.html      Pillars index with nav row + aligned list
  franchise/list.html    Franchise index + hub with Related Blogs
  partials/
    custom_head.html     Fonts, colors, CSS (site-wide)
    footer.html          Custom footer
hugo.toml                Site config
CHANGELOG.md             Changelog by date
README.md                Project overview
HANDOFF.md               This file
audit.sh                 Audit script

## Work Rules

Command style:
- Single line, single purpose
- Prefix with `p &&` (alias for `cd ~/5pc`)
- For writing files: `printf %b ... > file` (not heredoc)
- For small edits: `sed -i`
- Long output: `command > $TMPDIR/out.txt 2>&1 ; termux-clipboard-set < $TMPDIR/out.txt ; cat $TMPDIR/out.txt`

Aliases in ~/.bashrc:
- `p` = `cd ~/5pc`
- `h` = `hugo server --noBuildLock`
- `sc` = `termux-clipboard-set`
- `gc` = `termux-clipboard-get`

Hugo server is foreground. Kill with Ctrl+C before running other commands.

Commit ritual:
- Always update CHANGELOG.md in the same commit as code/content changes
- Rewrite the entire CHANGELOG.md when adding entries (never append incrementally, causes duplicate section headers)
- Push to main after every meaningful change

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
- Bold, opinionated first-person voice. Hermans bearblog style.

Pillar posts:
- Standard structure: intro paragraph, `## For Newcomers` (skip for music), `## The Story`.
- Front matter includes `release` (YYYY-MM-DD) and `franchise` (id, optional).
- Music format: title is `Artist - Song (Year)`, e.g. "Adele - Skyfall (2012)". No For Newcomers section.
- Slug follows title, e.g. `adele-skyfall-2012`.

Franchise hubs:
- Front matter includes `franchise_id`, `description`, and `date`.
- Body sections: intro paragraph (no heading), `## For Newcomers`, `## Five Pillars`.
- Five Pillars uses `<details>` blocks with `<ul>` lists, sorted by release year.
- Description is short (under 100 chars) for card display on /franchise/.
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
- --font-main: InterDisplay (headings, brand)
- --font-secondary: Inter (body)
- --font-mono: IBM Plex Mono (dates, list content)

Rules in custom_head.html:
- .title h2: InterDisplay 900 (site title)
- time: mono
- .tagline a: heading color, solid underline in link color
- footer: centered, brand split (Bluesky + X), em dash opacity 50%, year with slashed zero, back-to-top arrow in link color
- details summary: plus/minus toggle, hover changes color
- content ul (except .blog-posts and .pillar-list): arrow markers with hanging indent
- .pillar-list, .pillar-name: used by homepage and pillars index
- blockquote: no italic, margin 0 (used for franchise index cards)
- .arrow: heading color, applied to all arrows across site
- html: smooth scroll (prefers-reduced-motion)

## Layout Overrides

All in layouts/ (site-level, not in theme):
- _default/baseof.html: copy of theme, uses .Site.Language.Locale instead of deprecated .Site.LanguageCode
- _default/list.html: adds h1, uses .blog-posts for post list, release date fallback
- _default/single.html: blog essays (h1 + date); pillar posts (h1 + Released + franchise/pillar breadcrumb + "More in [Franchise]" section with sibling posts)
- index.html: homepage with Latest Pillars, Latest Blogs, Featured Franchise (by date)
- pillars/list.html: nav row + aligned list (grid with column-gap)
- franchise/list.html: index shows blockquote cards (no italic); hub shows Related Blogs
- about/list.html: h1 + content
- partials/custom_head.html: all site CSS and font links
- partials/footer.html: footer structure (baseof already wraps in footer tag)

## Current State

As of 2026-09-26:

Content:
- 4 pillar posts: 007 First Light (games), Adele - Skyfall (music), Game of Thrones (series), House of the Dragon (series)
- 2 blog essays: Why Bond Skipped TV, A Robot Child on the Moon
- 2 franchise hubs: James Bond 007, Game of Thrones

Site structure stable. Cloudflare auto-deploy on push.

## Pending Work

- Many pillar posts are placeholders (listed in franchise hubs 007 and game-of-thrones but no post yet)
- Franchise hubs other than 007 and Game of Thrones not started
- No search feature (considered and dropped)
- UI library: decided to skip (custom CSS is sufficient)

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
- site.Params.pillars in hugo.toml is the single source of pillar list. Do not hardcode inline slices in layouts.

## Rules for AI Assistants

- Do not improvise. If a request is ambiguous, ask with concrete options before writing commands.
- Do not overreach. If user asks to change one thing, change only that thing. Do not refactor adjacent code.
- Never commit without updating CHANGELOG.md in the same commit.
- Always rewrite the entire CHANGELOG.md when adding entries (never awk-append, causes duplicate headers).
- Never skip the clipboard pipe on commands with long output.
- Ask before deleting files or reverting user work.
- The user has corrected earlier mistakes before. Read their feedback literally, do not interpret loosely.

## Aliases

In ~/.bashrc:
- `p` = `cd ~/5pc`
- `h` = `hugo server --noBuildLock`
- `sc` = `termux-clipboard-set`
- `gc` = `termux-clipboard-get`

## Design Decisions (Why)

- Footer centered horizontal: user preference. Brand split into two links (Five Pillars to Bluesky, Compendium to X), registered trademark symbol outside link.
- No em dash: user style rule, applies to all writing including changelog and handoff.
- Blog titles short: pattern established with "Why Bond Skipped TV".
- Music title format "Artist - Song (Year)": distinguishes music pillar from other pillars.
- No dark mode: user wants light only, forced via color-scheme and variable overrides.
- No JS: site is static content, back-to-top uses native #top anchor with CSS smooth scroll.
- No versioning: site is not an application. Changelog uses dates instead of SemVer.
- site.Params.pillars: DRY single source for the five pillar types.

## Audit Command

When user says "audit", run: `p && bash audit.sh > $TMPDIR/audit.txt 2>&1 ; termux-clipboard-set < $TMPDIR/audit.txt ; cat $TMPDIR/audit.txt`

Checks:
- Duplicate content files (excluding _index.md)
- Duplicate titles (excluding _index.md)
- Duplicate CSS rules in custom_head.html
- Layout files list
- Unused static assets
- Orphan content (excluding blog essays, which are auto-listed)
- Git status

Report findings, do not auto-fix. Wait for user decision.
