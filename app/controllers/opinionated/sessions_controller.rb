class Opinionated::SessionsController < Opinionated::AdminController
  skip_before_action :authorize, only: [:new, :create]

  def new
    redirect_to admin_path if current_user
    redirect_to signup_path if Opinionated::User.all.count == 0
  end

  def create
    user = Opinionated::User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:opinionated_user_id] = user.id
      redirect_to admin_path
    else
      render "new"
    end
  end

  def destroy
    session[:opinionated_user_id] = nil
    redirect_to login_path
  end
end