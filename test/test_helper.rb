ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'webmock/minitest'
require 'stubs'

class ActiveSupport::TestCase
  include Stubs

  parallelize(workers: :number_of_processors)
  fixtures :all
end
