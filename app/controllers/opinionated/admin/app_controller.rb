class Opinionated::Admin::AppController < Opinionated::AdminController
  def app
    render :admin_app
  end
end