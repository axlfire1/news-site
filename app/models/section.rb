class Section < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    super & ['name'] # Add the attributes you want to make searchable
  end
      
  attr_accessor :name
end
