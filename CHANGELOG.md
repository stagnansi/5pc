# Changelog

## 2026-09-21

### Added
- First pillar post: 007 First Light (games)
- Blog essay: Why Bond Skipped TV
- Franchise hub: James Bond 007 with full catalog across five pillars
- Related Blogs section in franchise hubs
- Pillars index page with pillar nav row and aligned post list
- About page rewritten in first-person voice with contact links
- Franchises index page and layout
- Homepage: latest pillars, latest blogs, featured franchise
- Global arrow markers for content lists
- Site-wide custom_head: Inter Display, Inter, IBM Plex Mono fonts
- Footer: stacked brand (Bluesky + X links), back-to-top arrow, conditional visibility
- single.html override: h1 + Released date + pillar backlink for pillar posts
- list.html override: release date fallback to publish date
- h1 headings for section list pages

### Changed
- Brand rule: 5PC and Five Pillars Compendium always written with ®
- hugo.toml: timeZone Asia/Jakarta
- Force light mode site-wide
- Homepage, About, Pillars, Franchise hub content rewritten
- Blog essay: changed editorial "we" to third person
- Franchises index description: removed em dash

### Fixed
- Future-dated posts not rendering
- Nested footer element in footer partial

### Changed
- Pillar post metadata: split into two lines, add franchise backlink with title (from franchise _index.md)
