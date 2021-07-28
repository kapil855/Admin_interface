class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles

  before_create :default_role

  # Instance methods
  def admin?
    self.role == 'admin'
  end

  def default_role
    self.role = 'visitior' if self.role.nil?
  end
end
