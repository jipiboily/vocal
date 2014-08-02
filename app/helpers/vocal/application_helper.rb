module Vocal
  module ApplicationHelper
    def rss_head_link
      tag("link", href: feed_url, rel: "alternate", title: "RSS", type: "application/rss+xml")
    end
  end
end
