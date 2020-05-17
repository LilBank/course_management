class Course < ApplicationRecord
  validates :name, format: { with: /\A[a-zA-Z\s]+\z/, message: "Only allow letters" }

  has_and_belongs_to_many :users
end
