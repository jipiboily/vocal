class Opinionated::PostsController < Opinionated::ApplicationController
  def index
    @posts = Opinionated::Post.published.order('published_at DESC')
  end

  def show
    @post = Opinionated::Post.published.find_by(url: params[:post_url])
    if @post
      render :show
    else
      not_found
    end
  end
end