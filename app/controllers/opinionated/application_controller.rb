class Opinionated::ApplicationController < ActionController::Base
  layout :theme_layout

  before_action :prepend_view_paths

  # TODO: copied as-is from Monologue, let's test that and figure out if there is a cleaner way to achieve something like that...maybe use Mirego's Gaffe? (https://github.com/mirego/gaffe)
  def not_found
    # fallback to the default 404.html page from main_app.
    file = Rails.root.join('public', '404.html')
    if file.exist?
      render file: file.cleanpath.to_s.gsub(%r{#{file.extname}$}, ''),
         layout: false, status: 404, formats: [:html]
    else
      render action: "404", status: 404, formats: [:html]
    end
  end

  def prepend_view_paths
    prepend_view_path Opinionated::Theme::Helpers.theme_files_path
  end

  def theme_layout
    Opinionated::Theme::Helpers.layout_file
  end
end