require File.expand_path("../lib/jeditable_wysiwyg_rails/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name    = "jeditable_wysiwyg_rails"
  gem.version = JeditableWysiwygRails::VERSION
  gem.date    = Date.today.to_s

  gem.summary = "An edit-in-place gem for Rails 3"
  gem.description = "An edit-in-place gem using the JEditable jQuery plugin set up for the Rails 3 asset pipeline."

  gem.authors = ["Aidan Feldman", "Parker Morse"]
  gem.email   = "scytacki@concord.org"

  gem.files = Dir[
    'Gemfile',
    'Guardfile',
    'LICENCE.txt',
    'README.md',
    'Rakefile',
    '{lib,spec}/**/*'
  ]

  gem.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]

  gem.homepage = "http://github.com/concord-consortium/jeditable-wysiwyg-rails"
  gem.licenses = ["MIT"]

  # s.require_paths = ["lib"]
  # s.rubygems_version = "1.8.24"

  gem.add_dependency 'rails', ["~> 3.2.0"]
  gem.add_dependency 'jquery-rails', [">= 0"]

  gem.add_development_dependency 'rspec', ["~> 2.6", "< 2.99"]
  gem.add_development_dependency 'rspec-rails', ["~> 2.6", "< 2.99"]
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'test-unit'
  gem.add_development_dependency 'sqlite3', [">= 0"]

end

