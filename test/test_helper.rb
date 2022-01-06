ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

 class ActionDispatch::IntegrationTest
  
  begin class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers
  parallelize(workers: :number_of_processors)

  fixtures :all

    def log_in(user) 
      if integratio_test?
        login_as(user,:scope => :user)
      else
        sign_in(user)
      end
    end
  end

end
end
 