class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :login, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "no special characters allowed" }
  validates :citizen_id, presence: true, uniqueness: true, format: { with: /\A[0-9]+\z/, message: "only allows numbers" }
  validates :role, presence: true
  # validates :student_id, uniqueness: true, format: { with: /\A[0-9]+\z/, message: "only allows numbers" } #uniqueness: true
  # validates :instructor_id, uniqueness: true, format: { with: /\A[0-9]+\z/, message: "only allows numbers" } #uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  enum role: {'Student'=>'Student','Instructor'=>'Instructor','Other'=>'Other'}
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :groups
  has_many :projects
end
