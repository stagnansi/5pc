# 5PC®

Five Pillars Compendium® is a pop culture criticism site. One title, five ways to dissect it.

- Live: https://5pc.pages.dev
- Blog essays on media, franchises, and the culture around them
- Pillar posts across five verticals: Film, Series, Books, Games, Music
- Franchise hubs that gather every angle of a single franchise in one place

## Stack

- Hugo (static site generator, extended v0.166+)
- Bear Blog theme (janraasch/hugo-bearblog)
- Cloudflare Pages (auto-deploy on push to main)
- GitHub (stagnansi/5pc)

## Local Development

Prerequisites: Hugo extended, Git.

    git clone https://github.com/stagnansi/5pc.git
    cd 5pc
    hugo server --noBuildLock

Open http://localhost:1313 in a browser.

## Structure

    content/          Markdown content
      blog/           Essays
      film/           Pillar: Film
      series/         Pillar: Series
      books/          Pillar: Books
      games/          Pillar: Games
      music/          Pillar: Music
      franchise/      Franchise hubs
      pillars/        Index of all pillar posts
      about/          About page
    layouts/          Site-level layout overrides
    static/           Static assets
    hugo.toml         Site config
    CHANGELOG.md      Changelog by date
    HANDOFF.md        Project handoff for future work

## Content Conventions

- Language: English
- Brand: always 5PC® and Five Pillars Compendium®, never without ®
- No em dash in any writing
- Blog titles short (3-5 words)
- Pillar posts: intro, For Newcomers (except music), The Story
- Music title format: Artist - Song (Year)

## Documentation

- HANDOFF.md: full project handoff covering infrastructure, work rules, conventions, design system, and gotchas
- CHANGELOG.md: changelog by date

## Contact

- Bluesky: @5pc.nordra.me
- Email: fivepillarscompendium@gmail.com
- X: @compppendium

## License

Personal project. Content and code © 5PC®. The Bear Blog theme retains its own license.
