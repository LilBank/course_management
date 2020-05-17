class Project < ApplicationRecord
  validates :name, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "No special characters" }

  belongs_to :group
end
