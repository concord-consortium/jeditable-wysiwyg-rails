source 'http://rubygems.org'

gemspec

gem 'rails', '~> 3.2.0'
gem 'jquery-rails'

group :development do
  gem 'bundler', '~> 1.0'
  gem 'jeweler', '~> 1.5'
end

group :development, :test do
  gem 'rspec', '~> 2.6'
  gem 'rspec-rails', '~> 2.6', :require => 'rspec/rails'
  gem 'sqlite3'
end

group :test do
  # Guard runs tests automatically when the files they test (or the tests
  # themselves) change
  gem 'guard-rspec'
  # rb-fsevent is a Guard dependency
  gem 'rb-fsevent'
  # Rspec formatter
  gem 'fuubar'
end