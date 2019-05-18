ENV["RAILS_ENV"] ||= 'test'

if ENV["COVERAGE"]
  require 'simplecov'
end

# Allows rspec to recognize i18n error messages
require 'yaml'
require 'i18n'
I18n.enforce_available_locales = false
I18n.backend.store_translations(:en,
  YAML.load_file(File.open('./config/locales/en.yml'))['en']
)

RSpec.configure do |config|
  config.filter_run focus: true
  config.mock_with :rspec
  config.order = 'random'
  config.run_all_when_everything_filtered = true
end
