# [https://mapcorps.net](https://mapcorps.net)

## Development

1. Clone the repository to your computer and `cd` into it.
2. `npm run build`
3. `npm run dev`
4. Visit [http://127.0.0.1:4000](http://127.0.0.1:4000) in your browser.
5. To work with the CSS: `cd assets/stylesheets` and run `sass --watch style.sass:style.css`.

## Posts

Posts are implemented with [Jekyll posts](https://jekyllrb.com/docs/posts/). Addtional `yml` front matter is added for metatdata.

1. Visit `mapcorps.net/collections/_posts`.
2. Copy the latest `.md` files and rename to today's date, followed by your post title. This will become the "permalink" for the post.
3. Update the info in the frontmatter. Be sure to increment the `content_id` - this is what is used to generate the post numbers on the `/university` page.
