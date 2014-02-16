$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'opinionated/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'opinionated'
  s.version     = Opinionated::VERSION
  s.authors     = ['Jean-Philippe Boily']
  s.email       = ['j@jipi.ca']
  s.homepage    = 'http://jipiboily.com'
  s.summary     = 'Blog engine with opinions.'
  s.description = 'Blog engine with opinions. Nice, fast, Markdown are the keys.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.1.0.beta1'
  s.add_dependency 'bcrypt-ruby', '~> 3.1.2'

  s.add_development_dependency 'puma'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails', '~> 4.0'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'guard-rspec', '~> 4.2.5'
  s.add_development_dependency 'spring', '~> 1.1.1'
  s.add_development_dependency 'spring-commands-rspec'
  s.add_development_dependency 'terminal-notifier-guard'
end