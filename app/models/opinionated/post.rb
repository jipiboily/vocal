module Opinionated
  class Post < ActiveRecord::Base
    enum state: { draft: 0, published: 1, deleted: 2 }

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

    private
    def generate_url
      url ||= self.title.parameterize
    end
  end
end