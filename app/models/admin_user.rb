class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :publisher]

  validates :role, presence: true

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end
end
