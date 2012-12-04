# Configure Rails Envinronment - figured this out via http://stackoverflow.com/questions/5374504/rspec-gem-development-stubbing-rails-templates/6272019#6272019
ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# require File.join(File.dirname(__FILE__), 'dummy', 'config', 'environment.rb')
# require File.join(File.dirname(__FILE__), 'dummy', 'config', 'routes.rb')
# require 'rails/test_help'

# require 'bundler/setup'
# Bundler.require(:default)

# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
# $LOAD_PATH.unshift(File.dirname(__FILE__))
# require 'jeditable_wysiwyg_rails'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
# Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# run migrations on the dummy project
# `cd #{File.join('spec', 'dummy')} && rake db:migrate`

RSpec.configure do |config|
  config.mock_framework = :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include Rails.application.routes.url_helpers
end
