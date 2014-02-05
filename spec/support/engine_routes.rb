module Opinionated::SpecRouteHelper
  def self.included(base)
    base.routes { Opinionated::Engine.routes }
  end
end

RSpec.configure do |config|
  config.include Opinionated::SpecRouteHelper, type: :routing
  config.include Opinionated::SpecRouteHelper, type: :controller
end