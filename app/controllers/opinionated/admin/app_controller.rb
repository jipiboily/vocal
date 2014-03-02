class Opinionated::Admin::AppController < Opinionated::AdminController
  layout 'opinionated/admin'

  def app
    render :admin_app
  end
end
