class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    super & ['email', 'names', 'phone'] # Add the attributes you want to make searchable
  end
      
  attr_accessor :email, :names, :phone
end
