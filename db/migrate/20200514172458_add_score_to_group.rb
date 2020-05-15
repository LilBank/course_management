class AddScoreToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :score, :integer
  end
end
