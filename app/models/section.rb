class Section < ApplicationRecord
  has_many :news_wall

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    ["news_wall"]
  end

  validates_presence_of :name
end
