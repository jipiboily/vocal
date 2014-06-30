# ROADMAP
## 0.01 (pre-MVP - just to replace my own blog) - mi-juillet
- [X] date (& time?) picker (just date for now) -> ended up using native brower 'date' input. Sorry, old browser users, you'll have to suffer for now.
- [ ] frontend
  - [X] theme structure
  - [ ] latest posts (5 derniers?) - spécifique au thème ou à mon site?
  - [X] post listing
  - [ ] comments with disqus
- [ ] syntax highlighting style: same in admin and front
- [ ] tags/categories
- [ ] choose the final name
- [ ] RSS feed

## 0.1, aka MVP - début septembre (avant l'io)
- [ ] add client side testing
- [ ] editor improvements
  - [ ] clean copy pasted code (copy it's content in a textarea, and copy it back so it is clean?)
  - [ ] ...?
- [ ] pages (just a flag in the post table, indexed, and we don't list those)
- Frontend:
  - [ ] paging?
- [ ] replace date picker by date AND time picker
- [ ] nice 404 (especially for older URLs, like tags)
- [ ] support for some caching mechanism (memcached or redis)

## 0.2 (fin octobre)
- [ ] some keyboard shortcuts for the editor and other stuff? (bold CMD+B, new post (CMD-OPTION-N), save the post (CMD+OPTION+S), publish CMD+OPTION+P)
- [ ] add analytics for RSS (sneak-in the dashboard while I am there?)
- [ ] popular posts (hard coded or based on tags)

## 0.3 (fin novembre)
- auto post to Facebook, Twitter, Google Plus and one Subreddit?
- dashboard (with Google Analytics? Custom stuff?)
-- # of drafts
-- # of RSS views today (/week/month/year)
-- # of published posts
-- # of comments today (/week/month/year)
-- # of currently reading people
-- top 10 posts today (/week/month/year)


## 0.4
- Moodifier (taking a picture of the author while writing?):
  - WEBCAM + JAVASCRIPT = http://thenextweb.com/insider/2013/12/16/heres-digg-founder-kevin-roses-idea-new-blogging-platform-called-tiny/
  - http://thenextweb.com/insider/2013/12/16/heres-digg-founder-kevin-roses-idea-new-blogging-platform-called-tiny/
  - https://developer.mozilla.org/en-US/docs/WebRTC/Taking_webcam_photos


## MORE IDEAS
- amount of time to read (there might be some JS stuff to calculate that apparently, maybe som jQuery plugin or something?)
- text to speech would be great
- commenting in text like meldium (selecting a paragraph, or per paragraph/sentence commenting), in addition to disqus?
- you can take a picture for each blog post, of you while writing it or something like that, with blur effect added (not so sure yet)
- **Dashboard**
  - number of drafts
  - number of posts
  - number of readers right now online
  - number of readers in the last (configurable? Dropdown and change that?) (24 hours, 7 days, 30 days, last 365 days, this year)
  - most popular blog posts in the last.... (configurable? Dropdown and change that?)
  - inline commenting with something like http://aroc.github.io/side-comments-demo/?
