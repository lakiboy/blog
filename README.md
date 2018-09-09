# dmitri.io

Source code of my blog.

## Installation

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
