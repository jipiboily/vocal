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



**IMPORTANT**: this is a still an early version of Vocal, with some missing features and most probably some bugs! [Here is what is missing for the version 0.0.1 to be ready](https://github.com/jipiboily/vocal/milestones/0.01%20-%20pre-MVP). That version is basically the MVP for my own blog, then I will work on [0.0.2](https://github.com/jipiboily/vocal/milestones/0.0.2%20-%20pre-MVP%20+) and [0.1](https://github.com/jipiboily/vocal/milestones/0.1%20-%20MVP). You can look at the basic Kanban board I've setup to know where I'm at: https://waffle.io/jipiboily/vocal.


## Features

- Everything is in Markdown, side by side edit + preview in admin
  - Supports [GFM](https://github.github.com/github-flavored-markdown/)
- Vocal does not aim for minimal requirements, so it might not be as easy to mount into an existing app as [Monologue](https://github.com/jipiboily/monologue) is
- I will not try to get anything working for old browsers
- admin is built with Ember
- I want it to be fast, at least (in future versions)
- I dream about a dashboard with some basic analytics (in future versions)
- I want a couple of features to help reader retention (reading suggestions when reaching the end being one)
- It will have basic support for "static" pages for stuff like about pages
- I <3 keyboard shortcuts, so there will be some in admin (in future versions)
- No user management UI for now, single user, basically (well, not exactly, but this would not be usable in serious situations with multiple users)
- Assuming Postgres, but should work with MySQL

## Installation

1. Create a new Rails app: `rails new my-vocal-blorgh`.
- `cd my-vocal-blorgh`.
- Add `source 'https://rails-assets.org'` right after `source 'https://rubygems.org'` in your `Gemfile`
- Add `gem 'vocal'` to your `Gemfile`.
- Add the theme Gemfile, default being `gem 'vocal-theme-default'`.
- Run `bundle install`.
- `bundle exec rake vocal:install:migrations` to copy Vocal's migration into your project.
- Edit your database.yml with your database information.
- Create `config/initializers/vocal.rb` and set the default theme:
```ruby
Vocal.config.theme.name = 'default' # default is the name of the theme.
```
- `bundle exec rake db:create && bundle exec rake db:migrate`.
- Edit `config/routes.rb` and add `mount Vocal::Engine => "/"`
- `rails server`
- `open http://0.0.0.0:3000/admin` should get you to the admin signup screen (only possible when there is no admin user yet) and then the admin.

Now, jump to the full configuration...

### Configuration

For now, see [this example](https://github.com/jipiboily/vocal/blob/master/spec/dummy/config/initializers/vocal.rb).

## How to customize Vocal, or a theme?

In terms of customizations, you have a few options:
- create your own theme.
- add just some custom CSS or JS, if the theme supports it (the [default](https://github.com/jipiboily/vocal-theme-default) one does.)
- use Deface. How? See the next section.
- override any files, using the same path as the original one and it should be used instead of the original one.

### Customizing with Deface

First, add `gem 'deface'` in your Gemfile, then look at the [doc](https://github.com/spree/deface). You can do things like "insert X before this" and that kind of stuff, replace, and all. It's pretty sweet if you have mostly minor tweaks that would make overriding things overkill or "dangerous".

A few things to note:
- disable it in prod. Run `bundle exec rake deface:precompile` and add the compiled views to your repo, or run this task once deployed, depending on your deployment setup.
- this is specific to Vocal, but the way theming works right now requires a little tweak so Deface will find your theme's views. Add this to your `environment.rb`, at the end. I understand this is hacky, but this is what I came up with for now, suggestions welcomed, but there is a matter of when things get loaded and all.
  ```ruby
  # This is so that the Deface precompile task can find it
  ActionController::Base.append_view_path(Vocal::Theme::Helpers.theme_files_path)
  ```

## Contribute

### Setup

```bash
git clone git@github.com:jipiboily/vocal.git
cd vocal
bundle install
cp spec/dummy/config/database.sample.yml spec/dummy/config/database.yml
cd spec/dummy
bundle exec rake app:vocal:install:migrations
bundle exec rake db:setup
RAILS_ENV=test bundle exec rake db:setup
```

Boot your server and go to the admin: http://localhost:3000/admin.

### Optional setup steps

I personally use pow, so I also add this:

```bash
ln -s ~/code/vocal/spec/dummy ~/.pow/vocal
open http://vocal.dev/admin
```
