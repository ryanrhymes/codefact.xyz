# codefact.xyz
codefact.xyz website source code


### Development

To run the theme locally, navigate to the theme directory and run:

```bash
bundle install
```

To start the Jekyll local development server.

```bash
bundle exec jekyll serve --future
```

To build the theme.

```bash
bundle exec jekyll build
```

or simply run the following command.

```bash
make serve
```


## Deployment

The website is hosted on GitHub Pages. Every push to `main` builds and deploys the site through the GitHub Actions workflow in `.github/workflows/pages.yml`. The custom domain `codefact.xyz` is set in the repository's Settings → Pages, and its DNS records are managed at Namecheap.