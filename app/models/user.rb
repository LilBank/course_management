class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :login, presence: true
  validates :citizen_id, presence: true, uniqueness: true
  validates :role, presence: true
  # validates :student_id, uniqueness: true
  # validates :instructor_id, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  enum role: {'Student'=>'Student','Instructor'=>'Instructor','Other'=>'Other'}
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :groups
  has_many :projects
end
