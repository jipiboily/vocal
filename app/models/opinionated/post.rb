module Opinionated
  class Post < ActiveRecord::Base
    enum state: { draft: 0, published: 1, deleted: 2 }
    belongs_to :user

    validates :user_id, presence: true
    validate :published_at_required_to_publish

    after_initialize do
      self.state ||= :draft
    end

    before_save :generate_url

    def unpublish!
      draft!
    end

    def publish!
      published!
    end

    def delete!
      deleted!
    end

    def published_at= value
      if value && value.is_a?(String)
        date_chunks = value.split('-').map(&:to_i)
        self[:published_at] = Date.new(*date_chunks)
      end
    end

    private
    def generate_url
      if self.url.nil? || self.url.empty?
        self.url = self.title.parameterize if self.title
      end
    end

    def published_at_required_to_publish
      if published? && published_at.nil?
        errors.add(:published_at, "can't be blank")
      end
    end
  end
end