require 'test_helper'

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "should get course(s) from a single instructor" do
    assert_equal ["Spy course"], users(:user_007).courses.map { |course| course.name }
  end

  test "should get courses from a single instructors" do
    assert_equal ["Cooking","P.E.","Math"], users(:user_003).courses.map { |course| course.name }
  end

  test "should get courses from a single student" do
    assert_equal ["Spy course","Cooking","P.E."], users(:user_002).courses.map { |course| course.name }
  end
end
