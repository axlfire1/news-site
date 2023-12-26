class Section < ApplicationRecord
  has_many :news_walls
  has_many :announcements

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    ["announcements", "news_walls"]
  end

  validates_presence_of :name
end
