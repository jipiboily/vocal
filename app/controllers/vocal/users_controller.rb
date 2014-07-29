class Vocal::UsersController < Vocal::ApplicationController
  layout 'vocal/admin_no_session'

  def new
    if Vocal::User.count == 0
      @user = Vocal::User.new
    else
      redirect_to admin_path
    end
  end

  def create
    @user = Vocal::User.new(user_params)
    if @user.save
      session[:vocal_user_id] = @user.id
      redirect_to admin_path
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end