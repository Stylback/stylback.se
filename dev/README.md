# Development
This directory contains files to run a development instance of the website, enabling quick iteration.

## Prerequisites
- A copy of this project repository
- [Docker CLI](https://docs.docker.com/reference/cli/docker/), which usually comes bundled with a typical Docker installation

## Why a development instance?
Development and production instances have different use cases, as well as different pros and cons. In a development instance, we can quickly see the impact of changes to the codebase without having to push them to a server. On the other hand, a production instance is both lighter and more secure to serve to strangers on the internet. While it's perfectly possible (albeit not recommended) to use the development instance in production, it's a good learning experience to seperate them.

## How do I bring the development instance up?
Open a terminal in the project root directory and run this `docker build` command to build the image:

```bash
docker build -t jekyll-dev -f dev/Dockerfile .
```

Next, run this `docker compose` to bring the instance up:

```bash
docker compose -f dev/compose.yml up -d --build
```

Now you can simply visit [`localhost:4000`](http://localhost:4000/) in your browser to visit the development instance of the website. Any changes you make to the codebase can be quickly viewed by refreshing the webpage. If you rather the webpage refreshed by itself, you might want to take a look at the [`--livereload`](https://jekyllrb.com/docs/configuration/options/#build-command-options) Serve Command Option.

## How does the Dockerfile work?
The `Dockerfile` is a set of instructions to the Docker Engine on how to build an **image**. Let us have a look at the `Dockerfile` for the development instance:

```Dockerfile
FROM alpine:latest

RUN apk add --no-cache ruby ruby-dev gcc g++ make gcompat libc-dev
RUN gem install bundler
RUN gem install jekyll
RUN ruby -v && bundle -v && jekyll -v

WORKDIR /srv/jekyll
EXPOSE 4000
```

We start with our base image as the foundation to build the rest of the image on. I've choosen [`alpine`](https://hub.docker.com/_/alpine/) for this purpose becuase it's linux, lightweight (5 MB) and enjoys extensive package support.

Next, we install the prerequisite packages needed in order to get [Jekyll](https://jekyllrb.com/) up and running. In our case, this means `ruby`, `ruby-dev`, `gcc`, `g++`, `make`, `gcompat` and `libc-dev`. Next, we use the Ruby CLI to install [Bundler](https://bundler.io/) and Jekyll. As a sanity check we issue a `-v` command to `ruby`, `bundle` and `jekyll` to ensure that they were installed correctly.

Finally, we change the working directory within the image to `/srv/jekyll` and expose port 4000 of the image. We can now use Docker CLI or Docker Compose to attach our website files to the image and access the Jekyll web server through the exposed port.

If you're interested and want to learn more about the intricacies of `Dockerfile`, check out the [official documentation](https://docs.docker.com/reference/dockerfile/).

## How does the compose file work?
Similarily to a `Dockerfile`, a `compose.yml` file is a set of instructions to the Docker Engine on how to build a **container**. Here, we specify what images should be included in the container and what options they should run with. Let us take a look at the `compose.yml` for the development instance:

```yml
services:
  jekyll-dev:
    container_name: jekyll-dev
    image: jekyll-dev:latest
    ports:
      - 4000:4000
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - ../website:/srv/jekyll
    command: bundle exec jekyll serve -H 0.0.0.0
    restart: unless-stopped
```

Intialize the file with the `services` keyword, then we specify the name of our service (`jekyll-dev`, in our case). Next, we specify the container name for the service for us to reference later (in our case, also `jekyll-dev`). We specify which image should be included in the container, which happens to be the development instance image we built using the `Dockerfile` previously. We specify `external:internal` port numbers to bind in the container, which here is the same.

To continue, we use the `environment` keyword to specify what environment variables the container should run with. Here, we have set the `PUID`, `PGID`, `UMASK` variables to the default user per convention. The timezone variable `TZ` is strictly not necessary, but helps with consistency when dealing with logs.

Next, we attach the website files found in the `website` directory of this repository to the working directory of the container (`/srv/jekyll`). We specify a command to run when the container starts to enable the Jekyll web browser and serve the website. The `-H` option specifies that it should serve the website on `0.0.0.0` (aka `localhost`). Finally we allow the container to keep restaring in case of a failure unless we specifically stop it.

If you're interested and want to learn more, you can read about `compose.yml` in the [official documentation](https://docs.docker.com/compose/).