require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    get 'users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "should get index" do 
    get root_path
    assert_response :success
  end
end
