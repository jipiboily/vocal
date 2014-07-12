[![Stories in Ready](https://badge.waffle.io/jipiboily/vocal.png?label=ready&title=Ready)](https://waffle.io/jipiboily/vocal)
# Vocal

A Rails blogging engine, with opinions.

**IMPORTANT**: this is a very, very, very early version, not yet implemented and unlikely to get finished anytime soon.

[![Build Status](https://travis-ci.org/jipiboily/vocal.svg)](https://travis-ci.org/jipiboily/vocal)
[![Code Climate](https://codeclimate.com/github/jipiboily/vocal.png)](https://codeclimate.com/github/jipiboily/vocal)
[![Coverage Status](https://coveralls.io/repos/jipiboily/vocal/badge.png)](https://coveralls.io/r/jipiboily/vocal)

## Some opinions and features

- everything is in Markdown, side by side edit + preview in admin
-- supports GFM
- admin is built with Ember
- Vocal does not aim for minimal requirements, so it might not be as easy to mount into an existing app as [Monologue](https://github.com/jipiboily/monologue) is
- will not try to get anything working for old browsers
- I want it to be fast
- I dream about a dashboard with some basic analytics
- I want a couple of features to help reader retention (reading suggestions when reaching the end being one)
- it will have basic support for "static" pages for stuff like about pages
- I <3 keyboard shortcuts, so there will be some in admin
- No user management UI for now, single user, basically (well, not exactly, but this would not be usable in serious situations with multiple users)

## Installation

1. Add `source 'https://rails-assets.org'` to your Gemfile (probably as the second or third line).
- Add `gem 'vocal'` to your `Gemfile`
- run `bundle install`
- ...to be completed when it actually works!

Then jump to the configuration...

### Configuration
1. Add the theme's gem into your Gemfile
- run `bundle install`
- Set the theme:
```ruby
Vocal.config.theme = 'default' # default is the name of the theme. You
```