class NewsWall < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    super & ['slogan', 'title', 'subtitle', 'author', 'content']
  end

  attr_accessor :slogan, :title, :subtitle, :author, :content
end
