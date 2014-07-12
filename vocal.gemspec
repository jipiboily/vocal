$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'vocal/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'vocal'
  s.version     = Vocal::VERSION
  s.authors     = ['Jean-Philippe Boily']
  s.email       = ['j@jipi.ca']
  s.homepage    = 'http://jipiboily.com'
  s.summary     = 'Blog engine with opinions.'
  s.description = 'Blog engine with opinions. Nice, fast, Markdown are the keys.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.1.0'
  s.add_dependency 'active_model_serializers', '~> 0.9.0.alpha1'
  s.add_dependency 'slim', '~> 2.0.2'
  s.add_dependency 'bcrypt', '~> 3.1.7'
  s.add_dependency 'rails-assets-foundation', '~> 5.1.1'
  s.add_dependency 'ember-source', '~> 1.5.0.beta.3'
  s.add_dependency 'ember-data-source', '~> 1.0.0.beta.7'
  s.add_dependency 'ember-rails', '~> 0.14.1'
  s.add_dependency 'emblem-rails', '~> 0.2.1'
  s.add_dependency 'coffee-rails', '~> 4.0.1'
  s.add_dependency 'sass-rails', '~> 4.0.0'
  s.add_dependency 'configatron'

  s.add_development_dependency 'puma'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails', '~> 4.0'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'guard-rspec', '~> 4.2.5'
  s.add_development_dependency 'spring', '~> 1.1.1'
  s.add_development_dependency 'spring-commands-rspec'
  s.add_development_dependency 'terminal-notifier-guard'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-remote'
end
