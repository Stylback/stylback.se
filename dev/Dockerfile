# A single-stage Dockerfile for quick iterative development.
# Apline is used as the base image due to its small footprint
# Ruby and dependencies are installed along with Jekyll
# The static website is built and the resulting files are located in /srv/jekyll/_site/

FROM alpine:latest

RUN apk add --no-cache ruby ruby-dev gcc g++ make gcompat libc-dev
RUN gem install bundler
RUN gem install jekyll

# Sanity check to see that everything is installed
RUN ruby -v && bundle -v && jekyll -v

# Build
WORKDIR /srv/jekyll

EXPOSE 4000