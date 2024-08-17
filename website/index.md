---
title: Home
layout: home
---

# Welcome!
I'm Jonas and this is my website, it's a space of my own to highlight my projects and share some of the things I learn.

# Latest Posts
Why not have a look at some of my recent posts?

<ul class="blog-posts-list">
    {% for post in site.posts limit:3 %}
        <li><a href="{{ post.url }}">{{ post.date | date: "%Y-%m-%d" }}: {{ post.title }}</a></li>
    {% endfor %}
</ul>