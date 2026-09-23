# Changelog

All notable changes to 5PC® (Five Pillars Compendium®) will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.3.2] - 2026-09-23

### Added
- Blog essay: A Robot Child on the Moon

## [1.3.1] - 2026-09-23

### Changed
- Franchise hub 007: all pillars sorted by release year
- Changelog format: adopted Keep a Changelog + Semantic Versioning

## [1.3.0] - 2026-09-22

### Added
- Franchise hub: James Bond 007 with full catalog across five pillars
- Related Blogs section in franchise hubs (filtered by franchise front matter)
- Pillar post: Adele - Skyfall (music)

### Changed
- Pillar post metadata: split into two lines, add franchise backlink with title
- Music pillar slug follows title format: adele-skyfall-2012
- Franchises index description: removed em dash
- About rewrite in first-person voice with contact links (email, Bluesky)
- Blog essay: changed editorial "we" to third person

## [1.2.0] - 2026-09-21

### Added
- Footer: stacked brand (Bluesky + X links), back-to-top arrow, conditional visibility
- Global arrow markers for content lists
- Homepage: Latest Pillars, Latest Blogs, Featured Franchise sections

### Changed
- Force light mode site-wide
- Link color and visited color: #0000ff
- Site title: InterDisplay 900
- Pillars list: replaced hr with spacing
- Homepage tagline: dotted underline links in heading color
- Footer polish: figure dash separator, gap 0.2em, larger arrow, opacity removed

## [1.1.0] - 2026-09-21

### Added
- First pillar post: 007 First Light (games)
- Site-wide custom_head: Inter Display, Inter, IBM Plex Mono fonts
- single.html override: h1 + Released date + pillar backlink for pillar posts
- list.html override: release date fallback to publish date
- Homepage, About, Pillars, Franchises content pages
- h1 headings for section list pages

### Changed
- Brand rule: 5PC and Five Pillars Compendium always written with ®
- hugo.toml: timeZone Asia/Jakarta (fixes future-dated posts not rendering)

### Fixed
- Future-dated posts not rendering
- Nested footer element in footer partial

## [1.0.0] - 2026-09-21

### Added
- Initial 5PC site structure: film, series, books, games, music, blog, franchise, pillars, about sections
- Nav menu: Home, Blog, Franchises, Pillars, About
- hugo.toml: title, author, copyright, description
- Homepage tagline and Pillars index page

[Unreleased]: https://github.com/stagnansi/5pc/compare/v1.3.2...HEAD
[1.3.2]: https://github.com/stagnansi/5pc/compare/v1.3.1...v1.3.2
[1.3.1]: https://github.com/stagnansi/5pc/compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com/stagnansi/5pc/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/stagnansi/5pc/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/stagnansi/5pc/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/stagnansi/5pc/releases/tag/v1.0.0
