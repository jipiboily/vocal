class Opinionated::SessionsController < Opinionated::AdminController
  skip_before_action :authorize, only: :new

  def new
    redirect_to admin_path if current_user
    redirect_to signup_path if Opinionated::User.all.count == 0
  end
end