# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-sl-calendar'
  s.version           = '2.0.6.5'
  s.authors           = ['Fernando Fernández Zapico', 'David J. Brenes', ' Luis Eduardo Rodríguez Mendo', 'Philip Arndt', 'Joe Sak']
  s.description       = 'Ruby on Rails Calendar extension for Refinery CMS'
  s.email             = 'david.brenes@simplelogica.net'
  s.date              = '2015-11-19'
  s.summary           = 'Calendar extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib,vendor}/**/*"] + ["README.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.6'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.6'
end
