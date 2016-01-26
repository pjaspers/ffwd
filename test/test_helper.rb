ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

gem "minitest"
require "minitest"
require "minitest/test"
require "minitest/spec"
require "minitest/mock"
require "minitest/pride"

# This is all that's needed to run minitest, the only thing that's missing is the top
# level `describe` syntax.
#
# e.g. `describe User do`
#
# If we want that, we'll need to tell it how to know what class it is etc., so I prefer
# to keep our classes, classes and use the nice spec dsl inside the regular classes.
#
# KISS
#
# Unfortunately, the output is rather bland, because `pride` isn't picked up, because the
# Rails autorunner is rather convoluted.
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Remove describe method if present
  class << self
    remove_method :describe
  end if self.respond_to?(:describe) &&
         self.method(:describe).owner == ActiveSupport::TestCase

  # Add spec DSL
  extend Minitest::Spec::DSL
end
