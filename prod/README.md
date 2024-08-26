# Development
This directory contains files to run a production instance of the website, enabling a lightweight and (relatively) secure way to serve the website.

## Prerequisites
- A server (or similarily dedicated machine)
- A copy of this project repository
- [Docker CLI](https://docs.docker.com/reference/cli/docker/), which usually comes bundled with a typical Docker installation
- A reverse proxy, in order to expose the production instance of the website to the internet

## Why a production instance?
Development and production instances have different use cases, as well as different pros and cons. In a development instance, we can quickly see the impact of changes to the codebase without having to push them to a server. On the other hand, a production instance is both lighter and more secure to serve to strangers on the internet. While it's perfectly possible (albeit not recommended) to use the development instance in production, it's a good learning experience to seperate them.

## How do I bring the production instance up?
Open a terminal in the project root directory and run this `docker build` command to build the image:

```bash
docker build -t jekyll-prod -f prod/Dockerfile .
```

Next, run this `docker compose` to bring the instance up:

```bash
docker compose -f prod/compose.yml up -d --build
```

The production instance of the website will now be available on `localhost:3999` **on the server**. To expose it to the internet for the world to see you will have to use a reverse proxy. I've been using [Nginx Proxy Manager](https://nginxproxymanager.com/) due to how easy it is, my Proxy Host configuration for `www.stylback.se` looks like this:

```
DETAILS
Domain names:           www.stylback.se
Scheme:                 http
Forward Hostname / IP:  jekyll-prod
Forward Port:           3999
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        *.stylback.se
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        Yes
```

I can reference `jekyll-prod` in the `Forward Hostname / IP` field becuase they share the same Docker network. The `Scheme` is `http` becuase that's what's used between `jekyll-prod` and Nginx Proxy Manager, connections outside this context uses `https`.

## How does the Dockerfile work?
The `Dockerfile` is a set of instructions to the Docker Engine on how to build an **image**. As opposed to the development instance, the production instance uses a so-called "two-stage build architecture". In the first stage we build the static website files using Jekyll, in the second stage we construct a fresh image and transfer the website files over to it. This second stage contains a dedicated web server which will serve the static files on the designated port. This is considered best practice as the tools and assets necessary to **build** the website is present in the image that **serves** the website.

Let us have a closer look at the `Dockerfile` for the production instance:

```Dockerfile
# STAGE 1
FROM alpine:latest AS builder

RUN apk add --no-cache ruby ruby-dev gcc g++ make gcompat libc-dev
RUN gem install bundler
RUN gem install jekyll
RUN ruby -v && bundle -v && jekyll -v

ADD ./website /srv/jekyll
WORKDIR /srv/jekyll
RUN bundle exec jekyll build

# STAGE 2
FROM nginx:1-alpine-slim
ADD ./prod/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /srv/jekyll/_site /usr/share/nginx/html

EXPOSE 80
```

In stage one we start with [`alpine`](https://hub.docker.com/_/alpine/) as the foundation to build upon, we use `AS` to alias this image for later reference. Next, we install the prerequisite packages needed in order to get [Jekyll](https://jekyllrb.com/) up and running. In our case, this means `ruby`, `ruby-dev`, `gcc`, `g++`, `make`, `gcompat` and `libc-dev`. Next, we use the Ruby CLI to install [Bundler](https://bundler.io/) and Jekyll. As a sanity check we issue a `-v` command to `ruby`, `bundle` and `jekyll` to ensure that they were installed correctly. We attach the website files present in the `website` directory of this repository to the image. We make a call to the Jekyll CLI to build the static website files from the source files present in `website`.

In the second stage we start with a fresh image, this time a bare-minimum Alpine image with the [nginx](https://nginx.org/en/) web server pre-installed. We attach the `nginx.conf` configuration file to the image in the canonical destination of such files (`/etc/nginx/nginx.conf`), we then copy the static website files over from the previous image to the new image. Finally we expose port 80 of the image so as to access the web server within.

Using this two-stage build, the resulting image contains the bare minimum we need to serve our website; the static website files themselves and a web server to serve them. The first image along with its artifacts are discarded at the end of the build (with the exception of the files we copied over), as such they are not present in any form in the second image.

If you're interested and want to learn more about the intricacies of `Dockerfile`, check out the [official documentation](https://docs.docker.com/reference/dockerfile/).

## How does the compose file work?
Similarily to a `Dockerfile`, a `compose.yml` file is a set of instructions to the Docker Engine on how to build a **container**. Here, we specify what images should be included in the container and what options they should run with. Let us take a look at the `compose.yml` for the production instance:

```yml
services:
  jekyll-prod:
    container_name: jekyll-prod
    image: jekyll-prod:latest
    ports:
      - 3999:3999
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    restart: unless-stopped

networks:
  default:
    name: gravel
    external: true
```

Intialize the file with the `services` keyword, then we specify the name of our service (`jekyll-prod`, in our case). Next, we specify the container name for the service for us to reference later (in our case, also `jekyll-prod`). We specify which image should be included in the container, which happens to be the production instance image we built using the `Dockerfile` previously. We specify `external:internal` port numbers to bind in the container, which here is the same (you might think that we should bind the internal port 80 to the external port 3999, but the web server listens on port 3999 per the `ngingx.conf` file)

To continue, we use the `environment` keyword to specify what environment variables the container should run with. Here, we have set the `PUID`, `PGID`, `UMASK` variables to the default user per convention. The timezone variable `TZ` is strictly not necessary, but helps with consistency when dealing with logs. We allow the container to keep restaring in case of a failure unless we specifically stop it. Finally, we specify a Docker network for the container. We use `external: true` to indicate that the network already exists and does not need to be created.

If you're interested and want to learn more about Docker compose, you can read about `compose.yml` in the [official documentation](https://docs.docker.com/compose/).

# How does the nginx.conf file work?
`nginx.conf` is a [configuration file](https://nginx.org/en/docs/beginners_guide.html#conf_structure) for the nginx web server. Let us take a look at the `nginx.conf` for the production instance of the website:

```conf
events{}

http {
    include /etc/nginx/mime.types;
    
    server {
        listen 3999;
        server_name localhost;
        root /usr/share/nginx/html;
        index index.html;
        error_page 404 /404.html;
        port_in_redirect off;
        location / {
            autoindex off;
            try_files $uri.html $uri $uri/ =404;
        }
    }
}
```

We start the file with the `events{}` block, which is required. It is used for specifying actions that impact connection processing, but is not necessary for this project and is therefor left empty. Next up is the `http{}` block, within which we specify HTTP server directives. We see that within this block we have have included `/etc/nginx/mime.types`, which enables nginx to map file extensions to their Multipurpose Internet Mail Extensions (MIME) equivalents. Also within the `http{}` block resides the `server{}` block, which as you might've surmised is used to specify how the web server operates.

Within the `server{}` block we have specified that:
- the web server should listen for incoming traffic at `localhost:3999`
- the static website files to serve are located in `/usr/share/nginx/html`
- the landing page is `index.html` (located at `/usr/share/nginx/html/index.html`)
- the page to serve in case of 404 error (page not found) is `404.html` (located at `/usr/share/nginx/html/404.html`)
- the web server should not append the port number (`3999`) when handling redirects

We have also included a `location{}` block for the website root directory (`/`). `autoindex off` disables directory listing (aka "filebrowsing"), `try_files $uri.html $uri $uri/ =404` allows redirects to the real page when a slash is missed in the url (for example, `www.stylback.se/about` redirects to the correct URL `www.stylback.se/about/`). If no destination matched the allowed formats inluded in the argument, a 404 error is returned.