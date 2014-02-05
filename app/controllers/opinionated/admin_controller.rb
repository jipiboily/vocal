class Opinionated::AdminController < Opinionated::ApplicationController
  before_action :authorize

  private
  def current_user
    @current_user ||= Opinionated::User.find(session[:opinionated_user_id]) if session[:opinionated_user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end