## QuasarDB web interface Dockerfile

This repository contains the **Dockerfile** of [QuasarDB](http://www.quasardb.net/) web interface for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/bureau14/qdb/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

### Supported tags

|tag|description|
|---|---|
|`latest`|latest stable release|
|`beta`|latest beta release|
|`nightly`|bleeding edge|

### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/bureau14/qdb-http/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull bureau14/qdb-http`

   (alternatively, you can build an image from Dockerfile: `docker build -t="qdb-http" github.com/bureau14/qdb-httpd-docker`)

### Usage

#### Run `qdb-httpd` and link it to a `qdbd` container

    docker run -d -p 2836:2836 --name qdb-server bureau14/qdb
    docker run --link qdb-server:db -d -p 8080:8080 --name qdb-http-server bureau14/qdb-http

You can now navigate your browser to http://localhost:8080/ and get access to
QuasarDB's web interface.
