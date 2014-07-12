module Vocal::SpecRouteHelper
  def self.included(base)
    base.routes { Vocal::Engine.routes }
  end
end

RSpec.configure do |config|
  config.include Vocal::SpecRouteHelper, type: :routing
  config.include Vocal::SpecRouteHelper, type: :controller
end