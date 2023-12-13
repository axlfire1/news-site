ActiveAdmin.register NewsWall do
  permit_params :slogan, :title, :subtitle, :author, :content

  def self.ransackable_attributes(auth_object = nil)
    super & ['slogan', 'title', 'subtitle', 'author', 'content']
  end
end
