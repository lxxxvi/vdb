ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'webmock/minitest'
require 'stubs_helper'

class ActiveSupport::TestCase
  include StubsHelper

  parallelize(workers: :number_of_processors)
  fixtures :all
end
