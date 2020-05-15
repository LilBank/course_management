class GroupsUsers < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :course

  # self.primary_key = [:id]
end