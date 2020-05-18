require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should get a single user id" do
    assert_equal 1, users(:user_007).id
  end

  test "should get multiple users id" do
    assert_equal 1, users(:user_007).id
    assert_equal 2, users(:user_001).id
    assert_equal 3, users(:user_002).id
  end
end
