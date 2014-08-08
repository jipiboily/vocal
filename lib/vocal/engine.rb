require 'slim'
require 'rails-assets-foundation'
require 'ember-rails'
require 'emblem/rails'
require 'configatron'

module Vocal
  module Vocal::Theme;end
  class Engine < ::Rails::Engine
    isolate_namespace Vocal
    # TODO: it doesn't seem to work right now for the theme helpers...let's
    # figure that out at some point...
    # config.autoload_paths += Dir[File.expand_path("../theme", __FILE__)]
    # Manually requiring until then. It works, it just sucks when modifying it
    # and have Guard+Spring not picking up the new stuff.
    require 'vocal/theme/helpers'

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer :assets do |config|
      Vocal::Theme::Helpers.add_asset_path
    end

    config.assets.precompile += %w( vocal/admin.css vocal/admin.js )
  end

  module Vocal::Admin
  end

  def self.config
    configatron.vocal
  end
end