class Vocal::Admin::AppController < Vocal::AdminController
  layout 'vocal/admin'

  def app
    render :admin_app
  end
end
