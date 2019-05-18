require 'active_record'
require 'database_cleaner'
require 'factory_girl_rails'
require 'rspec/rails/extensions/active_record/base'

require_relative 'spec_helper_lite'

connection_info = YAML.load_file("config/database.yml")["test"]
ActiveRecord::Base.establish_connection(connection_info)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) { DatabaseCleaner.start }

  config.after(:each)  { DatabaseCleaner.clean }
end
