## Tech Stack

- [Jekyll](https://jekyllrb.com/docs/installation/) - Follow install instructions here.
- [SASS](https://sass-lang.com/install) - Follow install instructions here.
- [Bootstrap 4.0.0](https://getbootstrap.com/docs/4.0/getting-started/introduction/) via CDN.
- [jQuery 3.2.1](https://jquery.com/) via CDN.

## Local Development Instructions

1. Clone repository to your computer.
2. Using terminal, navigate to the `mapcorps.net` directory with `cd`.
3. In the directory type `bundle exec jekyll serve --baseurl ''`.
4. Visit [http://127.0.0.1:4000](http://127.0.0.1:4000) in your browser.
5. To work with the CSS: `cd assets/stylesheets` and run `sass --watch style.sass:style.css`.

Recommended to add to your `.bashrc` / `.zshrc` / etc. Replace paths to repo and browser with your own:

```bash
mcup() {
  cd /path/to/mapcorps.net
  open -a /Applications/Brave\ Browser.app http://127.0.0.1:4000
  bundle exec jekyll serve --baseurl ''
}

mcsass() {
  cd /path/to/mapcorps.net/assets/stylesheets
  sass --watch style.sass:style.css
}
```

## Adding Logs

Logs are implemented with [Jekyll collections](https://jekyllrb.com/docs/collections/).

1. Visit `mapcorps.net/collections/_logs`.
2. Copy one of the `.md` files.
3. Update the info in the frontmatter.
4. This now appears on the `/university` page.

## Adding Pages

Just add a new `your-page-name.md` file in the `_pages` directory. At the top of the file, add this "frontmatter":

```
---
layout: page
title: "your page name"
permalink: /your-page-name/
---
```

This is where you configure the page title and permalink. They can be anything you want.