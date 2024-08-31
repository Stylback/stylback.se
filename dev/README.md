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

## How does the `Dockerfile` work?
The `Dockerfile` is a set of instructions to the Docker Engine on how to build an **image**. Let us have a look at the `Dockerfile` for the development instance:

```Dockerfile
FROM alpine:latest

RUN apk add --no-cache ruby ruby-dev gcc g++ make gcompat libc-dev
RUN gem install bundler
RUN gem install jekyll
RUN ruby -v && bundle -v && jekyll -v

WORKDIR /srv/jekyll
```

We start with our base image as the foundation to build the rest of the image on. I've choosen [`alpine`](https://hub.docker.com/_/alpine/) for this purpose becuase it's linux, lightweight (5 MB) and enjoys extensive package support.

Next, we install the prerequisite packages needed in order to get [Jekyll](https://jekyllrb.com/) up and running. In our case, this means `ruby`, `ruby-dev`, `gcc`, `g++`, `make`, `gcompat` and `libc-dev`. Next, we use the Ruby CLI to install [Bundler](https://bundler.io/) and Jekyll. As a sanity check we issue a `-v` command to `ruby`, `bundle` and `jekyll` to ensure that they were installed correctly.

Finally, we change the working directory within the image to `/srv/jekyll`. We can now use Docker CLI or Docker Compose to attach our website files to the image and access the Jekyll web server through the a specified port.

> If you're interested and want to learn more about the intricacies of `Dockerfile`, check out the [official documentation](https://docs.docker.com/reference/dockerfile/).

## How does the `compose.yml` file work?
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

> If you're interested and want to learn more, you can read about `compose.yml` in the [official documentation](https://docs.docker.com/compose/).

## How does the `reduce.sh` file work?
`reduce.sh` is a home-cooked bash script to reduce the file size for media files, in order to speed up delivery of website contents to the visitor. `.jpg`, `.jpeg` and `.png` images have their metadata stripped and their resolution contained to a roughly ~1080x720px area with the help of [ImageMagick](https://imagemagick.org/index.php). `.mp4` video files are transcoded to VP9/Vorbis and placed in a `.webm` container using [HandBrake](https://handbrake.fr/). This reduces file sizes by around 70% with a negligible reduction in quality. 

Let us have a look at the contents of the script:

```bash
#! /bin/bash

ARG_1="$1" 	# $INPUT_PATH
ARG_2="$2" 	# $OUTPUT_PATH
INPUT_PATH=$(echo "$ARG_1" | sed 's:/*$::') 	# Removes trailing slashes
OUTPUT_PATH=$(echo "$ARG_2" | sed 's:/*$::') 	# Removes trailing slashes

if [[ ( ! -d $INPUT_PATH ) || ( -z "$INPUT_PATH" ) ]]; then
  echo "INPUT_PATH does not exist OR no argument, exiting."

elif [[ -z "$OUTPUT_PATH" ]]; then
  echo "No argument for OUTPUT_PATH, exiting."

else
  if [ ! -d $OUTPUT_PATH ]; then
    echo "$OUTPUT_PATH does not exist, creating..."
    mkdir -p $OUTPUT_PATH
  fi
  
  for FILE in $INPUT_PATH/*; do
    FILE="$FILE" 		        # In case of white characters in the filename
    BASENAME="${FILE##*/}" 	# Filename without extension

    if [[ ( $FILE == *.PNG ) || ( $FILE == *.png ) ]]; then
      convert ${FILE} -auto-orient -strip -resize 777600@\> $OUTPUT_PATH/"${BASENAME%.*}.png"
      echo "Saved ${FILE##*/} to $OUTPUT_PATH/${BASENAME%.*}.png"
	
    elif [[ ( $FILE == *.jpg ) || ( $FILE == *.JPG ) || ( $FILE == *.jpeg ) ]]; then
      convert ${FILE} -auto-orient -strip -resize 777600@\> $OUTPUT_PATH/"${BASENAME%.*}.jpg"
      echo "Saved ${FILE##*/} to $OUTPUT_PATH/${BASENAME%.*}.jpg"
	
    elif [[ $FILE == *.mp4 ]]; then
      HandBrakeCLI -e VP9 -E vorbis -f av_webm -i --two-pass $FILE -o $OUTPUT_PATH/"${BASENAME%.*}.webm"
      echo "Saved ${FILE##*/} to $OUTPUT_PATH/${BASENAME%.*}.webm"
	
    else
      echo "${FILE##*/} does not have a supported file format."
    fi
  done
fi
```



> If you're interested and want to learn more, have a look at the official documentation for [ImageMagick](https://www.imagemagick.org/script/convert.php), [HandbrakeCLI](https://handbrake.fr/docs/en/latest/cli/command-line-reference.html) and [Parameter Expansion](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html).

### So how big is the hit to image quality?

<p align="middle">
  <img src="/media/bee_original.jpg" width="45%" />
  &nbsp; &nbsp; &nbsp; &nbsp;
  <img src="/media/bee_reduced.jpg" width="45%" /> 
</p>

The left one is the original image (1.7 MB), the right one is the reduced image (171.3 kB).