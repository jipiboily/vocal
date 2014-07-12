class Vocal::Admin::PostsController < Vocal::AdminController
  def index
    render json: Vocal::Post.all
  end

  def show
    render json: Vocal::Post.find(params[:id]), root: :post
  end

  def create
    post = Vocal::Post.new
    post.user_id = current_user.id
    post.update!(post_params)
    post.publish! if to_publish?
    render json: post
  end

  def update
    post = Vocal::Post.find(params[:id])
    post.update!(post_params)
    to_publish? ? post.publish! : post.unpublish!
    render json: { save: true }
  end

  private
  def post_params
    @pubslihed = params[:post][:published]
    params[:post].delete(:published)
    params.require(:post).permit(:title, :markdown, :html, :published_at, :url)
  end

  def to_publish?
    @pubslihed == 'true'
  end
end
