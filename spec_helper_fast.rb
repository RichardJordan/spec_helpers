APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))
$: << File.join(APP_ROOT, "app", "controllers")

require 'action_controller'
require 'action_dispatch'

# module ActionController
#   class Base
#     class << self
#       attr_reader :before_filters
#       attr_reader :skipped_before_filters
#     end
#
#     def self.before_filter(*args)
#       @before_filters ||= []
#       @before_filters << args
#     end
#
#     def self.skip_before_filter(*args)
#       @skipped_before_filters ||= []
#       @skipped_before_filters << args
#     end
#
#     def self.helper_method(*args); end
#     def self.layout(*args); end
#     def self.protect_from_forgery(*args); end
#     def self.rescue_from(*args) end
#     def self.respond_to(*args); end
#     def render(*args); end
#     def redirect_to(*args); end
#     def render_template(*args); end
#     def params; {} end
#   end
# end

module ActiveRecord
  class RecordNotFound
    "Foo"
  end
end

require 'application_controller'

def stub_params(options = {})
  controller.class.send(:define_method, :params) do
    options
  end
end

def assigns(name)
  controller.instance_variable_get "@#{name}"
end

RSpec.configure do |config|

  config.after(:suite) do
    Object.send(:remove_const, 'ActionController')
    # load 'action_controller.rb'
  end

end
