ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
# require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

require "carving"

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
  # config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
