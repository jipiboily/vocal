class Vocal::AdminController < Vocal::ApplicationController
  before_action :authorize

  private
  def current_user
    @current_user ||= Vocal::User.find(session[:vocal_user_id]) if session[:vocal_user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end