class Opinionated::Admin::PostsController < Opinionated::AdminController
  def index
    render json: Opinionated::Post.all
  end

  def show
    render json: Opinionated::Post.find(params[:id]), root: :post
  end
end
