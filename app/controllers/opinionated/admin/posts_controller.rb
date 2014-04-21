class Opinionated::Admin::PostsController < Opinionated::AdminController
  def index
    render json: Opinionated::Post.all
  end

  def show
    render json: Opinionated::Post.find(params[:id]), root: :post
  end

  def create
    post = Opinionated::Post.new
    post.update!(post_params)
    render json: { save: true }
  end

  def update
    post = Opinionated::Post.find(params[:id])
    post.update!(post_params)
    render json: { save: true }
  end

  private
  def post_params
    params.require(:post).permit(:title, :markdown, :html)
  end
end
