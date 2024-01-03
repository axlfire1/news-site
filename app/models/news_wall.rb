class NewsWall < ApplicationRecord
  belongs_to :section
  mount_uploader :image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map(&:name)
  end

  validates_presence_of :title, :content, :section
end
