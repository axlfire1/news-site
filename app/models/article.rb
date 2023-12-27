class Article < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end
end
