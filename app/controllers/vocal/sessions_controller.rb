class Vocal::SessionsController < Vocal::AdminController
  skip_before_action :authorize, only: [:new, :create]
  layout 'vocal/admin_no_session'

  def new
    redirect_to admin_path if current_user
    redirect_to signup_path if Vocal::User.all.count == 0
  end

  def create
    user = Vocal::User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:vocal_user_id] = user.id
      redirect_to admin_path
    else
      render "new"
    end
  end

  def destroy
    session[:vocal_user_id] = nil
    redirect_to login_path
  end
end
