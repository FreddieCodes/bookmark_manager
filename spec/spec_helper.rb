ENV['RACK_ENV'] = 'test'


# require 'sinatra'
require 'capybara/rspec'
# require 'simplecov'
# require 'simplecov-console'
require 'database_cleaner'

require './app/app'
require './app/models/link.rb'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  # Everything in this block runs once before all the tests run
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  # Everything in this block runs once before each individual test
  config.before(:each) do
      DatabaseCleaner.start
  end

    # Everything in this block runs once after each individual test
  config.append_after(:each) do
    DatabaseCleaner.clean
  end

end
