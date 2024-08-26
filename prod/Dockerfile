# A two-stage Dockerfile, the first stage builds the website while the second serves it.
# Resources required to build the website is not present in the final, served, version.
# This is good for security, as only the bare minimum of resources are exposed to the internet.

# STAGE 1:
#   Apline is used as the base image due to its small footprint
#   Ruby and dependencies are installed along with Jekyll
#   The static website is built and the resulting files are located in /srv/jekyll/_site/

FROM alpine:latest AS builder

RUN apk add --no-cache ruby ruby-dev gcc g++ make gcompat libc-dev
RUN gem install bundler
RUN gem install jekyll

# Sanity check to see that everything is installed
RUN ruby -v && bundle -v && jekyll -v

# Build
ADD ./website /srv/jekyll
WORKDIR /srv/jekyll
RUN bundle exec jekyll build

# STAGE 2:
#   A minimal nginx Alpine image is used as base
#   The necessary files are copied over from the previous stage
#   Ports are exposed and the web server is ready to serve the site

FROM nginx:1-alpine-slim
ADD ./prod/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /srv/jekyll/_site /usr/share/nginx/html