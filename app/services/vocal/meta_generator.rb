class Vocal::MetaGenerator
  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TextHelper

  def initialize(post)
    @post = post
  end

  def title
    if for_a_post?
      "#{@post.title} by @#{Vocal.config.social.twitter.username}"
    else
      Vocal.config.meta.title
    end
  end

  def description
    if for_a_post?
      truncate(strip_tags(@post.html), length: 155)
    else
      Vocal.config.meta.description
    end

  end

  def image
    Vocal.config.meta.image_url
  end

  private
  def for_a_post?
    !!@post
  end
end
