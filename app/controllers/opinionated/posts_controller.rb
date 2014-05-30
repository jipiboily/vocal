class Opinionated::PostsController < Opinionated::ApplicationController
  def index
    @posts = Opinionated::Post.published.order('published_at DESC')
  end
end