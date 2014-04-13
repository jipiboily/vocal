# Opinionated

A Rails blogging engine, with opinions.

**IMPORTANT**: this is a very, very, very early version, not yet implemented and unlikely to get finished anytime soon.

[![Build Status](https://travis-ci.org/jipiboily/opinionated.svg)](https://travis-ci.org/jipiboily/opinionated)

## Some opinions

- everything will be in Markdown, with live preview
- admin will be using Ember
- I do not aim for minimal requirements, so it might not be as easy to mount into an existing app as [Monologue](https://github.com/jipiboily/monologue) is
- will not try to get anything working for old browsers
- I want it to be fast to load for readers
- I would love a dashboard with some basic analytics (not sure about the details)
- I want a couple of features to help reader retention (reading suggestions when reaching the end being one)

## Installation

1. Add `source 'https://rails-assets.org'` to your Gemfile (probably as the second or third line).
2. ...to be completed when it actually works!

## Features

- nice environment to write (admin)
  - side by side edit + preview
- Markdown
  - GitHub Flavored Markdown + code highlighting on BOTH, admin AND frontend
- nice, clean & responsive frontend
- speed: mostly for our clients, but for the admin, too!
  - Admin: Ember + API
  - Client: Redis caching (or maybe something else)
  - Client: Turbolinks?
  - Client: CDN and all that jazz
- Pages
  - Make it easy to add pages like "About" or whatever else
- when done reading (or almost), suggest another related post
- keyboard shortcuts & navigation (in admin)

### Bonus features

- you can take a picture for each blog post, of you while writing it or something like that, with blur effect added (not so sure yet)
- **Dashboard**
  - number of drafts
  - number of posts
  - number of readers right now online
  - number of readers in the last (configurable? Dropdown and change that?) (24 hours, 7 days, 30 days, last 365 days, this year)
  - most popular blog posts in the last.... (configurable? Dropdown and change that?)

### On purpose lack of...

- No user management UI for now

## Tools

- Rails
  - Engine
- slim && Emblem.js
- interesting?
  - http://wicky.nillia.ms/headroom.js/
