ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Helper to log users in for unit testing
  #
  # @param user [User] the user to log in
  # @return [void]
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest

  # Helper to log users in for integration testing
  #
  # @param user [User] the user to log in
  # @return [void]
  def log_in_as(user)
    post signin_path, params: { session: { username: user.username,
                                           password: 'password' } }
  end
end
