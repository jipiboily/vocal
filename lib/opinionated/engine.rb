module Opinionated
  class Engine < ::Rails::Engine
    isolate_namespace Opinionated

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
