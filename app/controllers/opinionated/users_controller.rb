class Opinionated::UsersController < Opinionated::ApplicationController
  def new
    if Opinionated::User.count == 0
      @user = Opinionated::User.new
    else
      redirect_to admin_path
    end
  end

  def create
    @user = Opinionated::User.new(user_params)
    if @user.save
      session[:opinionated_user_id] = @user.id
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