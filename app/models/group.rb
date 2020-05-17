class Group < ApplicationRecord
  validates :name, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "No special characters" }
  
  has_one :project
  has_and_belongs_to_many :users
end
