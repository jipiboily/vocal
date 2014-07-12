class Vocal::PostsController < Vocal::ApplicationController
  def index
    @posts = Vocal::Post.published.order('published_at DESC')
  end

  def show
    @post = Vocal::Post.published.find_by(url: params[:post_url])
    if @post
      render :show
    else
      not_found
    end
  end
end