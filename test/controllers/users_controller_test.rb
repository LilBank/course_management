require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_007)
    post user_session_url
  end

  test "should get index" do
    get groups_url
    assert_response :success
  end
end
