class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :markdown, :html, :url, :published_at, :published

  def published
    object.published?
  end
end