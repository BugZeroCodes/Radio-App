class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :readings

  validates :dj_name, :name, presence: true, uniqueness: true
  validates :role, presence: true

  def admin?
    self.role == 'admin'
  end
  def beginner?
    self.role == 'beginner'
  end
end
