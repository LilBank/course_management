class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  enum role: {'Student'=>'Student','Instructor'=>'Instructor','Other'=>'Other'}
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :groups
  has_many :projects
end
