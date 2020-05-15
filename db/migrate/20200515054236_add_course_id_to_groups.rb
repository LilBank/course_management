class AddCourseIdToGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :groups_users, :course, foreign_key: true
  end
end
