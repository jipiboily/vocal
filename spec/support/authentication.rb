module Opinionated::AuthenticationMock
  def sign_in_as user
    session[:opinionated_user_id] = user.id
  end
end

RSpec.configure do |config|
  config.include Opinionated::AuthenticationMock, type: :controller
end