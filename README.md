# Opinionated

A Ruby (Rails || Sinatra) blogging engine, with opinions.

[![Build Status](http://ci.wizestudios.com/github.com/jipiboily/opinionated/status.png?branch=master)](http://ci.wizestudios.com/github.com/jipiboily/opinionated/tree/master)

## Some opinions

- Not minimal, might not be as easy to plug in existing apps as Monologue
- will not try to get anything working for old browsers

## Features

- nice environment to write (admin)
- nice & responsive frontend
- speed: mostly for our clients, but for the admin, too!
-- Admin: Ember + API
-- Client: Redis caching
-- Client: Turbolinks
-- Client: CDN
- keyboard shortcuts & navigation
- Markdown
-- GitHub Flavored Markdown + code highlighting on BOTH, admin AND frontend
- "Static pages"
-- Make it easy to add pages like "About" or whatever else
- when done reading (or almost), suggest another related post

### Bonus features

- you can a picture taken for each blog post, with blur added
- Dashboard
-- number of drafts
-- number of posts
-- number of readers right now online
-- number of readers in the last (configurable? Dropdown and change that?) (24 hours, 7 days, 30 days, last 365 days, this year)
-- most popular blog posts in the last.... (configurable? Dropdown and change that?)

### Lack of...

- No user management UI for now

## Tools

- Rails
-- Engine
--
- Sinatra (with maybe Lotus::Router - https://github.com/lotus/router)
-- Pros: fast. I would learn for sure. Might be hard to move to Rails if required or wanted.
-- Cons: harder to do authentication, less experience with it, might get stuck more than once. Less security measures built-in.
--- Missing tools that are Rails specific.
-- Auth: https://github.com/jsmestad/sinatra_warden ?
-- https://github.com/rstacruz/sinatra-assetpack

- slim && Emblem.js

- JS code highlighting
-- http://craig.is/making/rainbows/
-- https://github.com/LeaVerou/prism/
-- https://github.com/isagalaev/highlight.js

- interesting:
-- http://wicky.nillia.ms/headroom.js/


## Later?

- the pictures could be non-blurred, or have other options like B&W or whatever else


## Create application

```ruby
rails plugin new opinionated --full --mountable --dummy-path spec/dummy --skip-test-unit
rails g model user email name password_digest
```

## Models

- User
- Content
- Page < Content
- Post < Content
- Tags
- ...?