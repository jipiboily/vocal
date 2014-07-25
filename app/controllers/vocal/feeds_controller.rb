class Vocal::FeedsController < Vocal::ApplicationController
  def index
    @posts = Vocal::Post.published
  end
end
