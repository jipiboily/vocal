require 'slim'
require 'rails-assets-foundation'

module Opinionated
  class Engine < ::Rails::Engine
    isolate_namespace Opinionated

    config.generators do |g|
      g.test_framework :rspec
    end
  end

  module Opinionated::Admin
  end
end