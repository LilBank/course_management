require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should get a project name" do
    assert_equal "FirstProject", projects(:project_001).name
  end
end
