xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title Vocal.config.meta.title
    xml.description Vocal.config.meta.description
    xml.link root_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description raw(post.html)
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link root_url + post.url
        xml.guid root_url + post.url
      end
    end
  end
end
