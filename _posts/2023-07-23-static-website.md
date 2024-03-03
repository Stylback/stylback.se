---
title: Static website with Jekyll
categories: self-hosting
updated: 2023-07-26
---

[Jekyll](https://jekyllrb.com) is an open-source static site generator and server. It takes a collection of source files (HTML, CSS, Markdown) and builds a ready-to-serve static website.

In this post I will demonstrate how to generate and serve a simple static website using Jekyll running in a Docker container. I will also show how to expose it to the internet using [Nginx Proxy Manager](https://nginxproxymanager.com/), how to implement hotlink protection and how to restrict access to certain directory paths.

### Prerequisites

I will make the following assumptions:

- You have access to a server
- You have Docker installed and configured
- You have Nginx Proxy Manager installed and configured
- You own a domain

If you lack any of these and need help getting started, take a look at my own self-hosted server implementation on [GitHub](https://github.com/Stylback/home-server).

### Initial setup

Start by creating the directory structure to house Jekyll and the website files. I will be using `/docker/jekyll`:

```bash
sudo mkdir -p /docker/jekyll/site
```

Next, create a basic website template in the `/site` subdirectory named `index.html`:

```bash
sudo nano /docker/jekyll/site/index.html
```

Paste the following:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Home</title>
  </head>
  <body>
    <h1>Hello World!</h1>
  </body>
</html>
```

Save and exit. Set directory permissions:

```bash
sudo chown -R $USER:$USER /docker/jekyll/site && sudo chmod -R a=,a+rX,u+w,g+w /docker/jekyll/site
```

Now it's time to create the Docker Compose file for Jekyll:

```bash
sudo nano /docker/jekyll/docker-compose.yml
```

Paste:

```yml
version: "3"
services:
  jekyll:
    container_name: jekyll-server
    image: jekyll/jekyll:4.2.0 # later versions have dependency issues with WEBrick
    ports:
      - 4000:4000
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm # Change accordingly
    volumes:
      - ./site:/srv/jekyll
    command: jekyll serve --watch --force_polling --verbose
    restart: unless-stopped
```

Save and exit. Bring the container and image up:

```bash
cd /docker/jekyll && sudo docker compose up -d
```

If everything went well, Jekyll will now be running in a Docker container. It will have found our HTML-file, generated a static website from it and served it on port `4000`. Open your browser and visit `<localhost>:4000`, you should be met with:

![White background, black letters spell out "Hello World!"](/assets/media/static-website/jekyll_hello_world.png)

### Modifying the template

Jekyll will watch the `/site` directory and its files for changes. When a change is detected, it will rebuild the website and serve the new content. Let's make a small modification to see that everything works as it should:

```bash
nano /docker/jekyll/site/index.html
```

Add `This is a test.` to `Hello World!`:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Home</title>
  </head>
  <body>
    <h1>Hello World! This is a test.</h1>
  </body>
</html>
```

Save and exit. Refresh the webpage and you should immediately see:

![White background, black letters spell out "Hello World! This is a test."](/assets/media/static-website/jekyll_hello_world_test.png)

For further modification I highly recommend that you follow Jekyll's [step-by-step guide](https://jekyllrb.com/docs/step-by-step/01-setup/) to get started. In addition to basic HTML/CSS, you will also be introduced to [Front Matter](https://jekyllrb.com/docs/front-matter/) and [Liquid templates](https://shopify.github.io/liquid/) which are powerful tools for streamlining deployment.

### Exposing it to the internet

Once you're comfortable with the look and feel of your website you might want to expose it to the internet for others to see.
To get started, open Nginx Proxy Manager and add a new Proxy Host Entry with the following configuration:

```
DETAILS
Domain names:           <subdomain>.<domain>.<tld>
Scheme:                 http
Forward Hostname / IP:  <localhost>
Forward Port:           4000
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        *.<domain>.<tld>
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        Yes
```

Save, enter `<subdomain>.<domain>.<tld>` in your browser and ensure you're met by the `Hello World!` webpage.

### Hotlink protection

Imagine you want to display an image on your website that originates from another website. You could download the image and upload it to your own, but that might result in copyright infringement. Instead, you could simply use a HTML hyperlink to link to that image. Whenever a visitor of yours wants to render that image it will be provided by the other website, not yours.

This is called [hotlinking](https://simple.wikipedia.org/wiki/Hotlinking) an image. While neat, it also means that others can hotlink **your** images and your server will be stuck providing that image to them as long as the image and hotlink exists. To prevent others from hotlinking files on your server, you can implement hotlink protection.

To do this in Nginx Proxy Manager, open up the Proxy Host Entry for Jekyll and navigate to the `Advanced` tab. Add the following, replacing `<domain>.<tld>` with your own:

```
valid_referers none blocked server_names
   *.<domain>.<tld>;

if ($invalid_referer) {
    return 403;
}
```

Save. Nginx Proxy Manager will now block any request that did not originate from your website. You can test this by pasting an image URL into free-webhosts [hotlink-checker](https://www.free-webhosts.com/hotlinking-checker.php), which should return a broken image icon.

### Restrict directory access

Sometimes you might want to restrict visitors to access certain directories, such as a directory with drafts.
The configuration depends on whether you want to block access to all files in a directory, the directory itself or both.

As an example, if you want to block access to the `/drafts/` directory only, you would add the following to your Proxy Hosts `Advanced` tab:

```
location /drafts/ {
    return 403;
}
```

Please see the [official documentation](https://nginx.org/en/docs/http/ngx_http_core_module.html#location) for correct syntax to match your use case.
Note that some suggest the use of `deny all;` instead of `return 403;`, I've found this to result in unintended behavior but your mileage may vary.

### Further configuration

So far we've touched on the essentials, if you're interested and want some inspiration for further configuration you can check out the [GitHub repository](https://github.com/Stylback/stylback.se) for this website.
There you will find documentation on how to implement a `robots.txt` file, dark/light mode, syntax highlight for code and more.