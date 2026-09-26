# Changelog

All notable changes to 5PC® (Five Pillars Compendium®) will be documented in this file.

## 2026-09-26

### Removed
- Back-to-top arrow and inline JS toggle
- Dead footer CSS (justify-content space-between)
- Semantic versioning and GitHub releases (site is not an application)

### Added
- Pillar post: Game of Thrones (series)
- Franchise hub GoT: backlink to series post

### Changed
- Background color: #fafafa (soft off-white)
- CSS: font smoothing, text-size-adjust, text-wrap balance
- Homepage Featured Franchise: shows most recently added franchise (by date)
- hugo.toml: pillars list moved to [params] (DRY)
- Layouts: read pillars from site.Params.pillars instead of inline slices
- audit.sh: reduce false positives and standards compliance (set -euo pipefail, quoted variables, read loop)
- Layout files: header comments for documentation
- single.html: nested if merged with and() for readability

### Fixed
- Pillar list: double arrow after inline style refactor
- Deprecation warning: .Site.LanguageCode replaced by .Site.Language.Locale via baseof override

## 2026-09-23

### Added
- Pillar post: Adele - Skyfall (music)
- Franchise hub: Game of Thrones (books, series, film, games, music)
- Blog essay: A Robot Child on the Moon
- HANDOFF.md: project documentation for future work
- README.md: project overview, stack, local dev, structure, conventions

### Changed
- Franchise hub 007: all pillars sorted by release year
- Pillar post metadata: split into two lines, add franchise backlink with title
- Music pillar slug follows title format: adele-skyfall-2012
- Franchises index description: removed em dash
- About rewrite in first-person voice with contact links (email, Bluesky)
- Blog essay: changed editorial "we" to third person

## 2026-09-22

### Added
- Franchise hub: James Bond 007 with full catalog across five pillars
- Related Blogs section in franchise hubs (filtered by franchise front matter)

## 2026-09-21

### Added
- Initial 5PC site structure: film, series, books, games, music, blog, franchise, pillars, about sections
- First pillar post: 007 First Light (games)
- Blog essay: Why Bond Skipped TV
- Site-wide custom_head: Inter Display, Inter, IBM Plex Mono fonts
- single.html override: h1 + Released date + pillar backlink for pillar posts
- list.html override: release date fallback to publish date
- Footer: stacked brand (Bluesky + X links)
- Homepage: tagline, Latest Pillars, Latest Blogs, Featured Franchise
- Global arrow markers for content lists

### Changed
- Brand rule: 5PC and Five Pillars Compendium always written with ®
- hugo.toml: timeZone Asia/Jakarta (fixes future-dated posts not rendering)
- Force light mode site-wide
- Link color and visited color: #0000ff
- Site title: InterDisplay 900

### Fixed
- Future-dated posts not rendering
- Nested footer element in footer partial
