module Vocal::AuthenticationMock
  def sign_in_as user
    session[:vocal_user_id] = user.id
  end
end

RSpec.configure do |config|
  config.include Vocal::AuthenticationMock, type: :controller
end