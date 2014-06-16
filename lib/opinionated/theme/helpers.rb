module Opinionated::Theme::Helpers
  def self.theme_name
    Opinionated.config.theme
  end

  def self.gem_name
    "opinionated-theme-#{theme_name}"
  end

  def self.theme_files_path
    root_path.join("opinionated_theme/#{theme_name}")
  end

  def self.layout_file
    'opinionated/layouts/application'
  end

  def self.add_asset_path
    Rails.application.config.assets.paths << assets_dir.join('javascripts').to_s
    Rails.application.config.assets.paths << assets_dir.join('stylesheets').to_s
    Rails.application.config.assets.paths << assets_dir.join('images').to_s
  end

  def self.root_path
    gem_specs = Bundler.definition.specs.reject { |gem| gem.name != gem_name }.first
    Pathname.new(gem_specs.full_gem_path)
  end

  def self.assets_dir
    theme_files_path.join('opinionated', 'assets')
  end
end