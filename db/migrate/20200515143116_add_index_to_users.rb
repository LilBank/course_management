class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :citizen_id, unique: true
    add_index :users, :login, unique: true
    # add_index :users, :student_id, unique: true
    # add_index :users, :instructor_id, unique: true
  end
end
