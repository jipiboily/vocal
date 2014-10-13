class Vocal::PostsController < Vocal::ApplicationController
  def index
    @posts = Vocal::Post.published.order('published_at DESC')
    @meta = Vocal::MetaGenerator.new(nil)
  end

  def show
    @post = Vocal::Post.published.find_by(url: params[:post_url])
    if @post
      @meta = Vocal::MetaGenerator.new(@post)
      render :show
    else
      not_found
    end
  end
end
