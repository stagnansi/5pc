# Changelog

All notable changes to 5PC® (Five Pillars Compendium®) will be documented in this file.

## 2026-09-26

### Added
- Custom footer: centered brand (Bluesky + X links), em dash, year with slashed zero, back-to-top anchor
- Pillar post: Game of Thrones (series)
- Franchise hub GoT: backlink to series post
- Smooth scroll via CSS (prefers-reduced-motion)

### Removed
- Semantic versioning and GitHub releases
- CSS from Web Interface Guidelines
- Inline JS toggle

### Changed
- Background color back to #fff
- Footer: centered custom
- Homepage Featured Franchise: shows most recently added franchise
- hugo.toml: pillars list moved to [params]
- Layouts: read pillars from site.Params.pillars
- audit.sh: standards compliance and exclude _index.md from title check
- Layout files: header comments
- single.html: nested if merged with and()

### Fixed
- Pillar list: double arrow after inline style refactor
- Deprecation warning: .Site.LanguageCode replaced by .Site.Language.Locale

## 2026-09-23

### Added
- Pillar post: Adele - Skyfall (music)
- Franchise hub: Game of Thrones
- Blog essay: A Robot Child on the Moon
- HANDOFF.md
- README.md

### Changed
- Franchise hub 007: sorted by release year
- Pillar post metadata: franchise backlink
- Music pillar slug: adele-skyfall-2012
- Franchises index: removed em dash
- About rewrite
- Blog essay: we-fix

## 2026-09-22

### Added
- Franchise hub: James Bond 007
- Related Blogs section

## 2026-09-21

### Added
- Initial 5PC site structure
- First pillar post: 007 First Light
- Blog essay: Why Bond Skipped TV
- Site-wide custom_head: fonts
- single.html and list.html overrides
- Homepage, About, Pillars content
- Global arrow markers

### Changed
- Brand rule: ® always
- hugo.toml: timeZone Asia/Jakarta
- Force light mode
- Link color #0000ff
- Site title InterDisplay 900

### Fixed
- Future-dated posts not rendering
- Nested footer element
