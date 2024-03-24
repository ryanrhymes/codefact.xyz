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

The website is deployed using Render serice, please check [Render Dashboard](https://dashboard.render.com/).


## Sync Webiste Content

Run the following command to continuous re-trigger website building and deployment.

```bash
./bin/sync_website.sh
```