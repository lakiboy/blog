# dmitri.io

Source code of my blog.

## Installation

Sync files:

```bash
$ docker-sync start
```

Install dependencies:

```bash
$ docker-compose run php composer install
```

Compile _Sass_:

```bash
$ docker-compose run php yarn css-build
```

Run locally:

```bash
$ docker-compose up
```

Browse the site:

```bash
$ open http://dmitri.docker
```

## Deploy

Build website:

```bash
$ docker-compose run php composer build
```
