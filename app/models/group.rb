class Group < ApplicationRecord
  has_one :project
  has_and_belongs_to_many :users
end
