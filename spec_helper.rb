require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

require_relative 'spec_helper_ar'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = true
end
