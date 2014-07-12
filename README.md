<h1 align="center">
  Vocal
</h1>
<p align="center">
  <b>Blog + Markdown = :heart:</b>
  <br />
  <a href="https://travis-ci.org/jipiboily/vocal"><img src="http://img.shields.io/travis/jipiboily/vocal/master.svg?style=flat" alt="Build Status"></a>
  <a href="https://codeclimate.com/github/jipiboily/vocal"><img src="http://img.shields.io/codeclimate/github/jipiboily/vocal.svg?style=flat" alt="Code Climate"></a>
  <a href="https://coveralls.io/r/jipiboily/vocal"><img src="http://img.shields.io/coveralls/jipiboily/vocal.svg?style=flat" alt="Coverage Status"></a>
</p>



**IMPORTANT**: this is a very, very, very early version, not yet implemented and unlikely to get finished anytime soon.


## Features

- everything is in Markdown, side by side edit + preview in admin
-- supports GFM
- admin is built with Ember
- Vocal does not aim for minimal requirements, so it might not be as easy to mount into an existing app as [Monologue](https://github.com/jipiboily/monologue) is
- I will not try to get anything working for old browsers
- I want it to be fast, at least (in future versions)
- I dream about a dashboard with some basic analytics (in future versions)
- I want a couple of features to help reader retention (reading suggestions when reaching the end being one)
- it will have basic support for "static" pages for stuff like about pages
- I <3 keyboard shortcuts, so there will be some in admin (in future versions)
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
