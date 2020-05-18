require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "should get groups name from a user" do
    assert_equal ["FirstGroup","SecondGroup"], users(:user_001).groups.map { |group| group.name }
  end

  test "should get groups name from multiple users" do
    assert_equal ["FirstGroup","SecondGroup"], users(:user_001).groups.map { |group| group.name }
    assert_equal ["ThirdGroup","FourthGroup"], users(:user_002).groups.map { |group| group.name }
    assert_equal ["SecondGroup","ThirdGroup"], users(:user_004).groups.map { |group| group.name }
  end
end
