# codefact.xyz

Source code of the Codefact Oy website, built with [Jekyll](https://jekyllrb.com/).

## Structure

- `index.html` – the home page.
- `privacy.md` – the privacy policy.
- `_data/books.yml` – the books shown on the home page.
- `_layouts/` – page templates.
- `assets/css/style.css` – the stylesheet.

## Development

```bash
bundle install
bundle exec jekyll serve
```

## Deployment

The website is hosted on GitHub Pages. Every push to `main` builds and deploys the site through the GitHub Actions workflow in `.github/workflows/pages.yml`. The custom domain `codefact.xyz` is set in the repository's Settings → Pages, and its DNS records are managed at Namecheap.
